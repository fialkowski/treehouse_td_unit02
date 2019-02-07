//
//  ButtonsHandler.swift
//  EnhanceQuizStarter
//
//  Created by nikko444 on 2019-01-29.
//  Copyright © 2019 Treehouse. All rights reserved.
//

import UIKit
import GameKit

class ButtonsHandler {
    private var answerButtons: [UIButton]
    private var controlButton: UIButton
    
    init (button1: UIButton,
          button2: UIButton,
          button3: UIButton,
          button4: UIButton,
          controlButton: UIButton,
          useRoundCornersWithRadius radius: Int = 0) {
        self.answerButtons = [button1]
        self.answerButtons += [button2]
        self.answerButtons += [button3]
        self.answerButtons += [button4]
        self.controlButton = controlButton
        setCorner(radius: CGFloat(radius)) //Sets buttons corner radius
    }
    
    ///Public Methods///
    
    ///Sets buttons for start menu
    func setStartMenuButtons () {
        hideButtons(withControlButton: true)
        answerButtons[0].setTitle(GameMenuButtonsCaptions.normalMode.rawValue, for: .normal)
        answerButtons[0].isHidden = false
        answerButtons[1].setTitle(GameMenuButtonsCaptions.lightningMode.rawValue, for: .normal)
        answerButtons[1].isHidden = false
    }
    
    ///Sets buttons for Trivia screen
    func setButtons (for trivia: TriviaModel) {
        hideButtons(withControlButton: true) //Hiding buttons, to set the captions
        var answerButtonLabels = makeButtonLabels(for: trivia) //appending all the options from the TriviaModel type to this array, to set the captions
        for answerButton in answerButtons { //Loops through the array of answerButtons
            if !answerButtonLabels.isEmpty {
                let answerButtonLabel = answerButtonLabels.remove(at: GKRandomSource.sharedRandom().nextInt(upperBound: answerButtonLabels.count - 1))
                answerButton.setTitle(answerButtonLabel, for: .normal)
                answerButton.isHidden = false
            } else {
                answerButton.isHidden = true
            }
        }
        controlButton.isHidden = true
    }
    
    ///Sets the captions of the controlButton depending on a number of asked questions
    func setControlButton (questionsPerRound: Int, questionsAsked: Int) {
        if questionsPerRound == questionsAsked {
            controlButton.setTitle(ControlButtonCaptions.displayScore.rawValue, for: .normal)
        } else {
            controlButton.setTitle(ControlButtonCaptions.nextQuestion.rawValue, for: .normal)
        }
        controlButton.isHidden = false
    }
    
    ///Greys out & disables all option buttons. Only used when in lighting mode
    func setTimeoutButtons () {
        for answerButton in answerButtons {
                answerButton.setTitleColor(UIColor.lightGray, for: .disabled)
                answerButton.isEnabled = false
            }
    }
    
    ///Sets buttons feedback - marking the correct answer with Bold & Green, marking wrong answer with Bold & Red.
    func buttonFeedBack(for trivia: TriviaModel, _ sender: UIButton) {
        for answerButton in answerButtons {
            answerButton.isEnabled = false
            if (trivia.answer == sender.titleLabel?.text) && (answerButton.titleLabel?.text == sender.titleLabel?.text){
                answerButton.setTitleColor(UIColor.GameColor.correctAnswerColor, for: .disabled)
                answerButton.titleLabel?.font = UIFont.GameFont.buttonBold
            } else if (trivia.answer != sender.titleLabel?.text) && (answerButton.titleLabel?.text == sender.titleLabel?.text) {
                answerButton.setTitleColor(UIColor.GameColor.wrongAnswerColor, for: .disabled)
                answerButton.titleLabel?.font = UIFont.GameFont.buttonBold
            } else if (trivia.answer != sender.titleLabel?.text) && (answerButton.titleLabel?.text == trivia.answer) {
                answerButton.setTitleColor(UIColor.GameColor.correctAnswerColor, for: .disabled)
                answerButton.titleLabel?.font = UIFont.GameFont.buttonBold
            } else {
                answerButton.setTitleColor(UIColor.lightGray, for: .disabled)
            }
        }
        
    }
    
    ///Hides answer option buttons and sets control button captions
    func setScoreScreen() {
        hideButtons(withControlButton: true)
        controlButton.setTitle(ControlButtonCaptions.playAgain.rawValue, for: .normal)
        controlButton.isHidden = false
    }
    
    ///Private methods///
    
    ///Hides buttons either with or without the control button
    private func hideButtons(withControlButton: Bool = false) { //TODO: ADD A WORD EXPLANATION
        for answerButton in answerButtons {
            answerButton.isEnabled = true
            answerButton.isHidden = true
            answerButton.titleLabel?.font = UIFont.GameFont.buttonDefault //Using an extension here
        }
        if withControlButton {
            controlButton.isEnabled = true
            controlButton.isHidden = true
            controlButton.titleLabel?.font = UIFont.GameFont.buttonDefault //Using an extension here
        }
    }
    
    ///Sets round corners of a passed radius
    private func setCorner (radius: CGFloat) {
        for answerButton in answerButtons {
            answerButton.layer.cornerRadius = radius
        }
        controlButton.layer.cornerRadius = radius
    }
    
    ///Transforms answer options from TriviaModel type to String Array of a proper length
    private func makeButtonLabels (for trivia: TriviaModel) -> [String] {
        var buttonLabels: [String] = [
                        trivia.answer,
                        trivia.option1
                        ]
        
        if trivia.option2 != nil { // Checking if 3rd answer option exists
            buttonLabels.append(trivia.option2!)
        }
        
        if trivia.option3 != nil { // Checking if 4th answer option exists
            buttonLabels.append(trivia.option3!)
        }
        return buttonLabels
    }
    
}
