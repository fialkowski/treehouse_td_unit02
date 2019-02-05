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
        setCorner(radius: CGFloat(radius))
    }
    
    func setButtons (for trivia: TriviaModel) { //TODO: refactor!
        hideButtons(withControlButton: true)
        var answerButtonLabels = makeButtonLabels(for: trivia)
        for answerButton in answerButtons {
            if !answerButtonLabels.isEmpty {
                let answerButtonLabel = answerButtonLabels.remove(at: GKRandomSource.sharedRandom().nextInt(upperBound: answerButtonLabels.count - 1))
                answerButton.setTitle(answerButtonLabel, for: .normal)
                answerButton.isHidden = false
            } else {
                answerButton.setTitle(AnswerButtonIs.hidden.rawValue, for: .normal)
                answerButton.isHidden = true
            }
        }
        controlButton.isHidden = true
    }
    
    func setControlButton (questionsPerRound: Int, questionsAsked: Int) {
        hideButtons(withControlButton: true)
        if questionsPerRound == questionsAsked {
            controlButton.setTitle(ControlButtonCaptions.playAgain.rawValue, for: .normal)
        } else {
            controlButton.setTitle(ControlButtonCaptions.nextQuestion.rawValue, for: .normal)
        }
        controlButton.isHidden = false
    }
    
    func buttonFeedBack(for trivia: TriviaModel, _ sender: UIButton) {
        hideButtons()
        for answerButton in answerButtons {
            if (trivia.answer == sender.titleLabel?.text) && (answerButton.titleLabel?.text == sender.titleLabel?.text){
                answerButton.setTitleColor(UIColor.green, for: .disabled)
            } else if (trivia.answer != sender.titleLabel?.text) && (answerButton.titleLabel?.text == sender.titleLabel?.text) {
                answerButton.setTitleColor(UIColor.orange, for: .disabled)
            } else if (trivia.answer != sender.titleLabel?.text) && (answerButton.titleLabel?.text == trivia.answer) {
                answerButton.setTitleColor(UIColor.green, for: .disabled)
            } else {
                answerButton.setTitleColor(UIColor.lightGray, for: .disabled)
            }
            if answerButton.titleLabel?.text != AnswerButtonIs.hidden.rawValue {
                answerButton.isEnabled = false
                answerButton.isHidden = false
            }
        }
        
    }
    
    ///Hides buttons not to show wrong options when they are just changed.
    private func hideButtons(withControlButton: Bool = false) { //TODO: ADD A WORD EXPLANATION
        for answerButton in answerButtons {
            answerButton.isEnabled = true
            answerButton.isHidden = true
        }
        if withControlButton {
            controlButton.isEnabled = true
            controlButton.isHidden = true
        }
    }
    
    ///Sets round corners of a passed radius
    private func setCorner (radius: CGFloat) {
        for answerButton in answerButtons {
            answerButton.layer.cornerRadius = radius
        }
        controlButton.layer.cornerRadius = radius
    }
    
    ///Transforms answer options from String to String Array of a proper length
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
