//
//  AppData.swift
//  iQuiz
//
//  Created by iguest on 10/29/18.
//  Copyright © 2018 stonek9. All rights reserved.
//

import UIKit

class AppData: NSObject {
    static let shared = AppData()
    
    // create arrays or information
    open var titles: [String] = ["Seattle"]
    open var desc: [String] = ["PNW"]
    open var topicIdx = 0
    
    open var seaQuestions: [String] = ["What is the Sports team?"]
    
    open var seaAnswers: [String] = ["Seahawks"]
    
}
