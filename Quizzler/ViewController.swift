//
//  ViewController.swift
//  Quizzler
//
//  Created by Dennis Nesanoff on 25.12.2019.
//  Copyright © 2019 Dennis Nesanoff. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var questions = [Question(q: "Which is the largest organ in the human body?", a: ["Heart", "Skin", "Large Intestine"], correctAnswer: "Skin"),
                 Question(q: "Five dollars is worth how many nickels?", a: ["25", "50", "100"], correctAnswer: "100"),
                 Question(q: "What do the letters in the GMT time zone stand for?", a: ["Global Meridian Time", "Greenwich Mean Time", "General Median Time"], correctAnswer: "Greenwich Mean Time"),
                 Question(q: "What is the French word for 'hat'?", a: ["Chapeau", "Écharpe", "Bonnet"], correctAnswer: "Chapeau"),
                 Question(q: "In past times, what would a gentleman keep in his fob pocket?", a: ["Notebook", "Handkerchief", "Watch"], correctAnswer: "Watch"),
                 Question(q: "How would one say goodbye in Spanish?", a: ["Au Revoir", "Adiós", "Salir"], correctAnswer: "Adiós"),
                 Question(q: "Which of these colours is NOT featured in the logo for Google?", a: ["Green", "Orange", "Blue"], correctAnswer: "Orange"),
                 Question(q: "What alcoholic drink is made from molasses?", a: ["Rum", "Whisky", "Gin"], correctAnswer: "Rum"),
                 Question(q: "What type of animal was Harambe?", a: ["Panda", "Gorilla", "Crocodile"], correctAnswer: "Gorilla"),
                 Question(q: "Where is Tasmania located?", a: ["Indonesia", "Australia", "Scotland"], correctAnswer: "Australia")
    ]
    
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var questioLabel: UILabel!
    @IBOutlet var firstAnswer: UIButton!
    @IBOutlet var secondAnswer: UIButton!
    @IBOutlet var thirdAnswer: UIButton!
    @IBOutlet var progressBar: UIProgressView!
    
    var currentQuestion = 0
    var score = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questions.shuffle()
        updateUI()
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        let answer = questions[currentQuestion].a[sender.tag]
        
        if answer == questions[currentQuestion].correctAnswer {
            score += 1
        } else {
            score -= 1
        }
        
        if currentQuestion + 1 < questions.count {
            currentQuestion += 1
        } else {
            currentQuestion = 0
            score = 0
            questions.shuffle()
        }
        
        updateUI()
    }
    
    func updateUI() {
        scoreLabel.text = "Score: \(score)"
        questioLabel.text = questions[currentQuestion].q
        firstAnswer.setTitle(questions[currentQuestion].a[0], for: .normal)
        secondAnswer.setTitle(questions[currentQuestion].a[1], for: .normal)
        thirdAnswer.setTitle(questions[currentQuestion].a[2], for: .normal)
        progressBar.progress = Float(currentQuestion + 1) / Float(questions.count)
    }
}

