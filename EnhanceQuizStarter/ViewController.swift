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
    
    // MARK: - Outlets
    
    @IBOutlet weak var informationLabel: UILabel!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var controlButton: UIButton!
    
    // MARK: - Custom class type variables
    //Force unwrapping optional classes since throwing errors is out of scope yet
    var labelHandler: LabelHandler?
    var buttonHandler: ButtonsHandler?
    var gamePlay: Gameplay?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelHandler = LabelHandler(informationLabel: informationLabel) //passing through label to LabelHandler class instance
        
        buttonHandler = ButtonsHandler(button1: button1, //passing through all buttons to ButtonsHandler class instance
                                      button2: button2,
                                      button3: button3,
                                      button4: button4,
                                      controlButton: controlButton,
                                      useRoundCornersWithRadius: 6)
        
        gamePlay = Gameplay(labelHandler: labelHandler!, //passing through aforementioned class instances
                            buttonHandler: buttonHandler!,
                            numberOfQuestionsPerRound: questionsPerRound)
        
        gamePlay!.setTriviaScreen() //setting an intitial trivia screen
    }

    @IBAction func checkAnswer(_ sender: UIButton) {
        gamePlay!.checkAnswer(sender) //calling checkAnswer method with UIButton sender parameter on GamePlay class instance
    }
    
    
    @IBAction func gameControl(_ sender: UIButton) {
        gamePlay!.gameControl(sender) //calling gameControl method with UIButton sender parameter on GamePlay class instance
    }
}

