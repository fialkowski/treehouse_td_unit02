//
//  ButtonHandler.swift
//  EnhanceQuizStarter
//
//  Created by nikko444 on 2019-01-29.
//  Copyright © 2019 Treehouse. All rights reserved.
//

import UIKit
import GameKit

class ButtonHandler {
    var answerButtons: [UIButton]
    var controlButton: UIButton
    
    
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
        hideAllButtons()
        controlButton.isHidden = true
    }
    
    private func hideAllButtons () { //TODO: ADD A WORD EXPLANATION
        for answerButton in answerButtons {
            answerButton.isHidden = true
        }
        controlButton.isHidden = true
    }

    private func setCorner (radius: CGFloat) {
        for answerButton in answerButtons {
            answerButton.layer.cornerRadius = radius
        }
        controlButton.layer.cornerRadius = radius
    }
    
}
