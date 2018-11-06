//
//  ResultViewController.swift
//  iQuiz
//
//  Created by iguest on 11/5/18.
//  Copyright © 2018 stonek9. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    var appdata = AppData.shared

    @IBOutlet weak var lblResult: UILabel!
    @IBOutlet weak var lblScore: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupResults()
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(btnReturn(_:)))
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(btnReturn(_:)))
        
        leftSwipe.direction = .left
        rightSwipe.direction = .right
        
        view.addGestureRecognizer(leftSwipe)
        view.addGestureRecognizer(rightSwipe)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnReturn(_ sender: Any) {
        appdata.numCorrect = 0
        appdata.questionIdx = 0
        appdata.chooseAns = ""
        self.performSegue(withIdentifier: "restart", sender: self)
    }
    
    func setupResults() {
        if appdata.numCorrect == 2 {
            lblResult.text = "Congratulations! 100%!!"
        } else {
            lblResult.text = "Awh, good try, better luck next time!"
        }
        lblScore.text = "\(appdata.numCorrect) of 2 correct!"
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
