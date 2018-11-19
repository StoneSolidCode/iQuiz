//
//  ViewController.swift
//  tableView
//
//  Created by iguest on 10/24/18.
//  Copyright © 2018 stonek9. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var appdata = AppData.shared
    
    //lets app know how many rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return appdata.categories.count
    }
    
    // creates contents of each row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "imageSubtitle") as! QuizCell
        cell.lblTitle.text = appdata.categories[indexPath.row]
        cell.lblDescription.text = appdata.descriptions[indexPath.row]
        cell.imgQuiz.image = appdata.images[indexPath.row]
        return cell
    }
    
    // creates the onClick response for rows
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = indexPath.row
        appdata.topicIdx = row
        if row == 0 {
            self.appdata.quizLength = appdata.movQuestions.count
        } else if row == 1 {
            self.appdata.quizLength = appdata.redQuestions.count
        } else if row == 2 {
            self.appdata.quizLength = appdata.vidQuestions.count
        }
        self.performSegue(withIdentifier: "toQuestion", sender: self)
    }
    
    
    
    @IBOutlet weak var tableView: UITableView!

    @IBAction func btnSettings(_ sender: UIBarButtonItem) {
        let uiAlert = UIAlertController(title: "Settings", message: "", preferredStyle: .alert)
        uiAlert.addAction(UIAlertAction(title: "Check Now", style: .default, handler: { (action: UIAlertAction!) in
            uiAlert .dismiss(animated: true, completion: nil)
            if let alertTextField = uiAlert.textFields?.first, alertTextField.text != nil {
                self.appdata.baseURL = alertTextField.text!
            }
            self.fetchData()
        }))
        uiAlert.addTextField(configurationHandler: { (textField) in
            textField.placeholder = "https://tednewardsandbox.site44.com/questions.json"
        })
        uiAlert.addAction(UIAlertAction(title: "Cancel",
                                   style: UIAlertAction.Style.cancel,
                                   handler: nil))
        self.present(uiAlert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.doTableRefresh()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        fetchData()
        super.viewWillAppear(animated)
    }
    
    func fetchData() {
        if NetworkReachabilityManager()!.isReachable {
            let baseURL = appdata.baseURL
            Alamofire.request(baseURL).responseJSON { response in
                guard response.result.isSuccess else {
                    let uiAlert = UIAlertController(title: "Unable to retrieve data!", message: "", preferredStyle: .alert)
                    uiAlert.addAction(UIAlertAction(title: "Cancel",
                                                    style: UIAlertAction.Style.cancel,
                                                    handler: nil))
                    self.present(uiAlert, animated: true, completion: nil)
                    return
                }
                //print(response)
                guard let value = response.result.value as? [[String:Any]] else {
                    let uiAlert = UIAlertController(title: "Unable to retrieve data!", message: "", preferredStyle: .alert)
                    uiAlert.addAction(UIAlertAction(title: "Cancel",
                                                    style: UIAlertAction.Style.cancel,
                                                    handler: nil))
                    self.present(uiAlert, animated: true, completion: nil)
                    return
                }
                print(value)
                self.appdata.correctAns = []
                for quiz in 0...2 {
                    self.appdata.categories[quiz] = value[quiz]["title"] as! String
                    self.appdata.descriptions[quiz] = value[quiz]["desc"] as! String
                    if quiz == 0 {
                        self.appdata.movQuestions = []
                        self.appdata.movAnswers = []
                        let quizJson = value[0]
                        self.appdata.quizLength = (quizJson["questions"] as? [[String:Any]])!.count
                        for q in (quizJson["questions"] as? [[String:Any]])!{
                            let answer = q["answer"] as? String
                            let ans = Int(answer!)! - 1
                            let answers = q["answers"] as? [String]
                            self.appdata.correctAns.append((answers![ans] as? String)!)
                            self.appdata.movQuestions.append(q["text"] as! String)
                            self.appdata.movAnswers += q["answers"] as! [String]
                        }
                    } else if quiz == 1 {
                        self.appdata.redQuestions = []
                        self.appdata.redAnswers = []
                        let quizJson = value[1]
                        for q in (quizJson["questions"] as? [[String:Any]])!{
                            let answer = q["answer"] as? String
                            let ans = Int(answer!)! - 1
                            let answers = q["answers"] as? [String]
                            self.appdata.correctAns.append((answers![ans] as? String)!)
                            self.appdata.redQuestions.append(q["text"] as! String)
                            self.appdata.redAnswers += q["answers"] as! [String]
                        }
                    } else if quiz == 2 {
                        self.appdata.vidQuestions = []
                        self.appdata.vidAnswers = []
                        let quizJson = value[2]
                        for q in (quizJson["questions"] as? [[String:Any]])!{
                            let answer = q["answer"] as? String
                            let ans = Int(answer!)! - 1
                            let answers = q["answers"] as? [String]
                            self.appdata.correctAns.append((answers![ans] as? String)!)
                            self.appdata.vidQuestions.append(q["text"] as! String)
                            self.appdata.vidAnswers += q["answers"] as! [String]
                        }
                    }
                }
                self.doTableRefresh()
            }
        } else {
            let uiAlert = UIAlertController(title: "No Internet Connection!", message: "", preferredStyle: .alert)
            uiAlert.addAction(UIAlertAction(title: "Close",
                                            style: UIAlertAction.Style.cancel,
                                            handler: nil))
            self.present(uiAlert, animated: true, completion: nil)
        }
    }
    
    func doTableRefresh() {
        DispatchQueue.main.async(execute: { () -> Void in
            self.tableView.reloadData()
            return
        })
    }
}

