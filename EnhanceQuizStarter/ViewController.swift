//
//  ViewController.swift
//  EnhanceQuizStarter
//
//  Created by Pasan Premaratne on 3/12/18.
//  Copyright © 2018 Treehouse. All rights reserved.
//

import UIKit
import GameKit
import AudioToolbox

class ViewController: UIViewController {
    
    // MARK: - Properties
    
    let questionsPerRound = 4
    var questionsAsked = 0
    var correctQuestions = 0
    var indexOfSelectedQuestion = 0
    
    var gameSound: SystemSoundID = 0
    
    // MARK: - Outlets
    
    @IBOutlet weak var informationLabel: UILabel!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var controlButton: UIButton!
    
    var labelHandler: LabelHandler?
    var buttonHandler: ButtonHandler?
    var gamePlay: Gameplay?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelHandler = LabelHandler(informationLabel: informationLabel)
        
        buttonHandler = ButtonHandler(button1: button1,
                                      button2: button2,
                                      button3: button3,
                                      button4: button4,
                                      controlButton: controlButton,
                                      useRoundCornersWithRadius: 6)
        
        gamePlay = Gameplay(labelHandler: labelHandler!,
                            buttonHandler: buttonHandler!,
                            numberOfQuestionsPerRound: questionsPerRound)
        
        gamePlay!.setTriviaScreen()
    }
    
    // MARK: - Helpers
    /*
    
    func displayQuestion() {
        let questionDictionary = trivia.uniqueRandomTrivia()
        questionField.text = questionDictionary.key
        controlButton.isHidden = true
    }
    
    func displayScore() {
        // Hide the answer uttons
        button1.isHidden = true
        button3.isHidden = true
        
        // Display play again button
        controlButton.isHidden = false
        
        questionField.text = "Way to go!\nYou got \(correctQuestions) out of \(questionsPerRound) correct!"
    }
    
    func nextRound() {
        if questionsAsked == questionsPerRound {
            // Game is over
            displayScore()
        } else {
            // Continue game
            displayQuestion()
        }
    }
    
    func loadNextRound(delay seconds: Int) {
        // Converts a delay in seconds to nanoseconds as signed 64 bit integer
        let delay = Int64(NSEC_PER_SEC * UInt64(seconds))
        // Calculates a time value to execute the method given current time and delay
        let dispatchTime = DispatchTime.now() + Double(delay) / Double(NSEC_PER_SEC)
        
        // Executes the nextRound method at the dispatch time on the main queue
        DispatchQueue.main.asyncAfter(deadline: dispatchTime) {
            self.nextRound()
        }
    }
    */
    // MARK: - Actions
    
    @IBAction func checkAnswer(_ sender: UIButton) {
        gamePlay!.checkAnswer(sender)
        // Increment the questions asked counter
        
        /*
        questionsAsked += 1
        
        let selectedQuestionDict = trivia[indexOfSelectedQuestion]
        let correctAnswer = selectedQuestionDict["Answer"]
        
        if (sender === trueButton &&  correctAnswer == "True") || (sender === falseButton && correctAnswer == "False") {
            correctQuestions += 1
            questionField.text = "Correct!"
        } else {
            questionField.text = "Sorry, wrong answer!"
        }
        
        loadNextRound(delay: 2)
         */
    }
    
    
    @IBAction func gameControl(_ sender: UIButton) {
        gamePlay!.gameControl(sender)
    }
    

}

