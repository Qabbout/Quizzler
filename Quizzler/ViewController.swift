//
//  ViewController.swift
//  Quizzler
//
//  Created by Abdulrahman on 12/15/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    
    let quiz = [
        Question(text: "4 + 2 = 6", answer: "True"),
        Question(text: "5 - 3 > 1", answer: "True"),
        Question(text: "3 + 8 = 10", answer: "False"),
    ]
    var questionNumber = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.titleLabel!.text!
        let actualAnswer = quiz[questionNumber].answer
        
        if userAnswer == actualAnswer {
            print("Right!")
        }
        else {
            print("Wrong")
        }
        
        if questionNumber + 1 < quiz.count {
            questionNumber += 1
            
        }
        else {
            questionNumber = 0
        }
        
        updateUI()
    }
    
    func updateUI(){
        questionLabel.text = quiz[questionNumber].text
    }
    
}

