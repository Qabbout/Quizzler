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
    @IBOutlet weak var scoreLabel: UILabel!
    
    var quizBrain = QuizBrain()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        progressBar.layer.cornerRadius = 8
        trueButton.layer.cornerRadius = 8
        falseButton.layer.cornerRadius = 8
        updateUI()
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.titleLabel!.text!
        let isAnswerRight = quizBrain.checkAnswer(for: userAnswer)
        
        if isAnswerRight {
            

            UIView.animate(withDuration: 0.8, delay: 0, animations: {
                
                sender.layer.borderWidth = 3
                sender.layer.borderColor = UIColor.green.cgColor
                sender.layer.borderWidth = 0
                
            })
            
        }
        else {
            UIView.animate(withDuration: 0.5, delay: 0, animations: {
                sender.layer.borderWidth = 3
                sender.layer.borderColor = UIColor.red.cgColor
                sender.layer.borderWidth = 0
            })
            
        }
        
        quizBrain.nextQuestion()
        updateUI()
    }
    
    @objc func updateUI(){
        questionLabel.text = quizBrain.getQuestionText()
        scoreLabel.text = "Score: \(quizBrain.getScore()) / \(quizBrain.quiz.count)"
        progressBar.setProgress(quizBrain.getProgress(), animated: true)
        UIView.animate(withDuration: 0.5, delay: 0 , animations: { [weak self] in
            self?.trueButton.layer.borderColor = UIColor.clear.cgColor
            self?.falseButton.layer.borderColor = UIColor.clear.cgColor
            

        })
           
        
        
    }
    
}

