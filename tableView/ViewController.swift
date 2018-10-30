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
        return self.categories.count
    }
    
    // creates contents of each row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "imageSubtitle") as! QuizCell
//        if cell == nil {
//            NSLog("Creating new UITableViewCell")
//            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "NameTableIdentifier") as! QuizCell
//        }
        
        cell.lblTitle.text = self.categories[indexPath.row]
        cell.lblDescription.text = self.descriptions[indexPath.row]
        cell.imgQuiz.image = images[indexPath.row]
        return cell
    }
    
    
    let categories = ["Movies", "Reddit", "Video Games"]
    let descriptions = ["Old classics, new hits, test your movie knoledge!", "The front page of the internet. Test your knoledge on Reddit lore!", "Nerd out over videogames from all genres!"]
    let images = [UIImage(named: "film"), UIImage(named: "reddit"), UIImage(named: "game")]
    
    // creates the onClick response for rows
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let row = indexPath.row
//        var name = ""
//        name = categories[row]
//        let uiAlert = UIAlertController(title: "You selected", message: name, preferredStyle: .alert)
//        self.present(uiAlert, animated: true, completion: nil)
//    }
    
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

