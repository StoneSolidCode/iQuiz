//
//  ViewController.swift
//  tableView
//
//  Created by iguest on 10/24/18.
//  Copyright © 2018 stonek9. All rights reserved.
//

import UIKit

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
        tableView.dataSource = self
        tableView.delegate = self
    }
}

