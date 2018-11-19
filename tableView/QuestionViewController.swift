//
//  QuestionViewController.swift
//  iQuiz
//
//  Created by iguest on 10/29/18.
//  Copyright © 2018 stonek9. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {
    var appdata = AppData.shared
    @IBOutlet weak var lblQuestion: UILabel!
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var btn4: UIButton!
    @IBAction func btn1Selected(_ sender: UIButton) {
        appdata.chooseAns = sender.currentTitle!
    }
    @IBAction func btnSubmit(_ sender: Any) {
        if appdata.chooseAns != "" {
            if appdata.correctAns.contains(appdata.chooseAns) {
                appdata.numCorrect += 1
                appdata.prevCorrect = true
            } else {
                appdata.prevCorrect = false
            }
            self.performSegue(withIdentifier: "toAnswer", sender: self)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        newQuestion()
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(btnSubmit(_:)))
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(btnReturn(_:)))
        
        leftSwipe.direction = .left
        rightSwipe.direction = .right
        
        view.addGestureRecognizer(leftSwipe)
        view.addGestureRecognizer(rightSwipe)
        // Do any additional setup after loading the view.
    }
    
    func newQuestion() {
        switch appdata.topicIdx {
        case 0:
            print(appdata.questionIdx)
            lblQuestion.text = appdata.movQuestions[appdata.questionIdx]
            btn1.setTitle(appdata.movAnswers[0 + 4 * appdata.questionIdx], for: .normal)
            btn2.setTitle(appdata.movAnswers[1 + 4 * appdata.questionIdx], for: .normal)
            btn3.setTitle(appdata.movAnswers[2 + 4 * appdata.questionIdx], for: .normal)
            btn4.setTitle(appdata.movAnswers[3 + 4 * appdata.questionIdx], for: .normal)
        case 1:
            lblQuestion.text = appdata.redQuestions[appdata.questionIdx]
            btn1.setTitle(appdata.redAnswers[0 + 4 * appdata.questionIdx], for: .normal)
            btn2.setTitle(appdata.redAnswers[1 + 4 * appdata.questionIdx], for: .normal)
            btn3.setTitle(appdata.redAnswers[2 + 4 * appdata.questionIdx], for: .normal)
            btn4.setTitle(appdata.redAnswers[3 + 4 * appdata.questionIdx], for: .normal)
        case 2:
            lblQuestion.text = appdata.vidQuestions[appdata.questionIdx]
            btn1.setTitle(appdata.vidAnswers[0 + 4 * appdata.questionIdx], for: .normal)
            btn2.setTitle(appdata.vidAnswers[1 + 4 * appdata.questionIdx], for: .normal)
            btn3.setTitle(appdata.vidAnswers[2 + 4 * appdata.questionIdx], for: .normal)
            btn4.setTitle(appdata.vidAnswers[3 + 4 * appdata.questionIdx], for: .normal)
        default:
            lblQuestion.text = appdata.seaQuestions[appdata.questionIdx]
            btn1.setTitle(appdata.seaAnswers[0], for: .normal)
        }
    }
    
    @IBAction func btnReturn(_ sender: Any) {
        appdata.numCorrect = 0
        appdata.questionIdx = 0
        appdata.chooseAns = ""
        self.performSegue(withIdentifier: "restart", sender: self)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
