//
//  AnswerViewController.swift
//  iQuiz
//
//  Created by iguest on 11/5/18.
//  Copyright © 2018 stonek9. All rights reserved.
//

import UIKit

class AnswerViewController: UIViewController {
    var appdata = AppData.shared

    @IBOutlet weak var lblQuestion: UILabel!
    @IBOutlet weak var lblAnswer: UILabel!
    @IBOutlet weak var lblResult: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        checkAnswer()
        appdata.questionIdx += 1
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(btnMoveOn(_:)))
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(btnReturn(_:)))
        
        leftSwipe.direction = .left
        rightSwipe.direction = .right
        
        view.addGestureRecognizer(leftSwipe)
        view.addGestureRecognizer(rightSwipe)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnMoveOn(_ sender: Any) {
        if appdata.questionIdx == 2 {
            self.performSegue(withIdentifier: "done", sender: self)
        } else {
            self.performSegue(withIdentifier: "anotherQuestion", sender: self)
        }
    }
    func checkAnswer() {
        switch appdata.topicIdx {
        case 0:
            lblQuestion.text = appdata.movQuestions[appdata.questionIdx]
        case 1:
            lblQuestion.text = appdata.redQuestions[appdata.questionIdx]
        case 2:
            lblQuestion.text = appdata.vidQuestions[appdata.questionIdx]
        default:
            lblQuestion.text = "The program messed up! Don't blame the coder"
        }
        lblAnswer.text = appdata.correctAns[appdata.questionIdx + appdata.topicIdx * 2]
        if appdata.prevCorrect {
            lblResult.text = "You were correct!"
        } else {
            lblResult.text = "Sorry, that was the wrong answer."
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
