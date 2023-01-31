//
//  ViewController.swift
//  Quizzler
//
//  Created by Дмитрий Яковлев on 31.01.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    
    var quizBrain = QuizBrain()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
        
        trueButton.layer.cornerRadius = 10
        falseButton.layer.cornerRadius = 10
    
          
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle!
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        
        
        if userGotItRight   {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        
        quizBrain.nextQuestion()
       
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        
            
        
    }
    

    
   @objc func updateUI(){
       questionLabel.text = quizBrain.getQuestionText()
       progressBar.progress = quizBrain.getProgress()
       
       scoreLabel.text = "Score: \(quizBrain.getScore())"
       
       
        trueButton.backgroundColor = UIColor(red: 170/255, green: 117/255, blue: 170/255, alpha: 0.5)

        falseButton.backgroundColor = UIColor(red: 170/255, green: 117/255, blue: 170/255, alpha: 0.5)

        
    }
      
    
}

