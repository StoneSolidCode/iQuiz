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
    open var topicIdx = 0
    open var questionIdx = 0
    open var chooseAns = ""
    open var correctAns = ["Snow White and the Seven Dwarfs","Avatar","The front page of the internet","r/AskReddit","CrossFire","Pokemon"]
    open var numCorrect = 0
    open var prevCorrect = false
    
    open var seaQuestions: [String] = ["What is the Sports team?"]
    open var seaAnswers: [String] = ["Seahawks"]
    
    open var movQuestions: [String] = ["What was the first full length Disney film ever released?", "What is currently the highest box office grossing film ever released?"]
    open var redQuestions: [String] = ["What is Reddit's slogan?", "What is currently the most active subreddit?"]
    open var vidQuestions: [String] = ["What is the most popular video game by peak number of concurrent players?", "What is the highest grossing video game franchise?"]
    
    open var movAnswers: [String] = ["Pinocchio", "Snow White and the Seven Dwarfs", "Toy Story", "Peter Pan", "Titanic", "Star Wars: The Force Awakens", "Avengers: Infinity War", "Avatar"]
    open var redAnswers: [String] = ["The internet's greatest information source", "The center of cyberspace", "The front page of the internet", "News, debate, and memes", "r/AskReddit", "r/Funny", "r/ProgrammorHumor", "r/gifs"]
    open var vidAnswers: [String] = ["CrossFire", "Fortnite", "Runescape", "Dungeon Fighter Online", "Mario", "Call of Duty", "Pokemon", "Pac-Man"]
    
    public var categories = ["Movies", "Reddit", "Video Games"]
    public var descriptions = ["Old classics, new hits, test your movie knoledge!", "The front page of the internet. Test your knoledge on Reddit lore!", "Nerd out over videogames from all genres!"]
    public var images = [UIImage(named: "film"), UIImage(named: "reddit"), UIImage(named: "game")]
    
    
    
}
