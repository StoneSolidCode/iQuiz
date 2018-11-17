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
        self.performSegue(withIdentifier: "toQuestion", sender: self)
    }
    
    
    
    @IBOutlet weak var tableView: UITableView!

    @IBAction func btnSettings(_ sender: UIBarButtonItem) {
        let uiAlert = UIAlertController(title: "Check back for settings!", message: "", preferredStyle: .alert)
        uiAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action: UIAlertAction!) in
            uiAlert .dismiss(animated: true, completion: nil)
        }))
        self.present(uiAlert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        fetchData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        fetchData()
        super.viewWillAppear(animated)
    }
    
    func fetchData() {
        let baseURL = "https://tednewardsandbox.site44.com/questions.json"
        NSLog("test")
        Alamofire.request(baseURL).responseJSON { response in
            if let resp = response.result.value {
                
                //print(json["title"])
                let dictionary = resp as? NSDictionary
//                let json = try JSONSerialization.jsonObject(with: resp!, options:.allowFragments)
//                print(dictionary!)
                guard let main = dictionary?["main"] as? NSDictionary else {
                    print("Couldn't find main")
                    return
                }
                for quiz in 0...2 {
                    self.appdata.categories[quiz] = main["title"] as! String
                    NSLog(main["title"] as! String)
                    self.appdata.descriptions[quiz] = main["desc"] as! String
                }
                self.doTableRefresh()
            }
            
        }
    }
    func doTableRefresh() {
        DispatchQueue.main.async(execute: { () -> Void in
            self.tableView.reloadData()
            return
        })
    }
    
    
    
    
}

