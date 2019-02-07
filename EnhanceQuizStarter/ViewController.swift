//
//  ViewController.swift
//  EnhanceQuizStarter
//
//  Created by Pasan Premaratne on 3/12/18.
//  Copyright © 2018 Treehouse. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Properties
    
    let lightingModeTimeout = 15.0
    let questionsPerRound = 10
    var questionsAsked = 0
    var correctQuestions = 0
    var indexOfSelectedQuestion = 0
    
    // MARK: - Outlets
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var feedbackLabel: UILabel!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var controlButton: UIButton!
    
    // MARK: - Custom class type variables
    //Force unwrapping optional classes since throwing errors is out of scope yet
    var labelsHandler: LabelsHandler?
    var buttonsHandler: ButtonsHandler?
    var gamePlay: Gameplay?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelsHandler = LabelsHandler(questionLabel: questionLabel,
                                    feedbackLabel: feedbackLabel,
                                    view: view) //passing through label to LabelsHandler class instance
        
        buttonsHandler = ButtonsHandler(button1: button1, //passing through all buttons to ButtonsHandler class instance
                                      button2: button2,
                                      button3: button3,
                                      button4: button4,
                                      controlButton: controlButton,
                                      useRoundCornersWithRadius: 6)
        
        gamePlay = Gameplay(labelsHandler: labelsHandler!, //passing through aforementioned class instances
                            buttonsHandler: buttonsHandler!,
                            numberOfQuestionsPerRound: questionsPerRound,
                            lightningModeTimeout: lightingModeTimeout
                            )
        
        gamePlay!.displayMenu() //setting an intitial trivia screen
    }

    @IBAction func checkAnswer(_ sender: UIButton) {
        gamePlay!.checkAnswer(sender) //calling checkAnswer method with UIButton sender parameter on GamePlay class instance
    }
    
    
    @IBAction func gameControl(_ sender: UIButton) {
        gamePlay!.gameControl(sender) //calling gameControl method with UIButton sender parameter on GamePlay class instance
    }
}

