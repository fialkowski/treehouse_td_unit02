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
          controlButton: UIButton) {
        self.answerButtons = [button1]
        self.answerButtons += [button2]
        self.answerButtons += [button3]
        self.answerButtons += [button4]
        self.controlButton = controlButton
    }
    
    func setButtons (for options: inout [String]) { //TODO: ADD A WORD EXPLANATION
        hideAllButtons()
        for answerButton in answerButtons {
            if options.isEmpty {
                answerButton.setTitle("You weren't supposed to see this! BOO!", for: .normal)
            } else {
                let option = options.remove(at: GKRandomSource.sharedRandom().nextInt(upperBound: options.count - 1))
                answerButton.setTitle(option, for: .normal)
                answerButton.isHidden = false
            }
        }
        controlButton.isHidden = true
    }
    
    private func hideAllButtons () { //TODO: ADD A WORD EXPLANATION
        for answerButton in answerButtons {
            answerButton.isHidden = true
        }
        controlButton.isHidden = true
    }
}
