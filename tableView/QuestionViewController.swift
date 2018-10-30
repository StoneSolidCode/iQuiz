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
    @IBOutlet weak var btnBack: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        newQuestion()
        // Do any additional setup after loading the view.
    }
    
    func newQuestion() {
        switch appdata.topicIdx {
        case 0:
            lblQuestion.text = appdata.seaQuestions[appdata.topicIdx]
            btn1.setTitle(appdata.seaAnswers[0], for: .normal)
        default:
            lblQuestion.text = appdata.seaQuestions[appdata.topicIdx]
            btn1.setTitle(appdata.seaAnswers[0], for: .normal)
        }
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
