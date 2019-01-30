//
//  ButtonHandler.swift
//  EnhanceQuizStarter
//
//  Created by nikko444 on 2019-01-29.
//  Copyright © 2019 Treehouse. All rights reserved.
//

import UIKit

class ButtonHandler {
    var button1: UIButton
    var button2: UIButton
    var button3: UIButton
    var button4: UIButton
    var controlButton: UIButton
    init (button1: UIButton,
          button2: UIButton,
          button3: UIButton,
          button4: UIButton,
          controlButton: UIButton) {
        self.button1 = button1
        self.button2 = button2
        self.button3 = button3
        self.button4 = button4
        self.controlButton = controlButton
    }
}
