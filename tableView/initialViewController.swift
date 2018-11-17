//
//  initialViewController.swift
//  iQuiz
//
//  Created by iguest on 11/16/18.
//  Copyright © 2018 stonek9. All rights reserved.
//

import UIKit
import Alamofire
class initialViewController: UIViewController {
    var appdata = AppData.shared
    override func viewDidLoad() {
        super.viewDidLoad()
        self.performSegue(withIdentifier: "initial", sender: self)
        // Do any additional setup after loading the view.
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
                let dictionary = resp as? NSDictionary
                guard let main = dictionary?["main"] as? NSDictionary else {
                    print("Couldn't find main")
                    return
                }
                for quiz in 0...2 {
                    self.appdata.categories[quiz] = main["title"] as! String
                    NSLog(main["title"] as! String)
                    self.appdata.descriptions[quiz] = main["desc"] as! String
                }
            }
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
