//
//  Gameplay.swift
//  EnhanceQuizStarter
//
//  Created by nikko444 on 2019-01-29.
//  Copyright © 2019 Treehouse. All rights reserved.
//
import UIKit

class Gameplay {
    var questionField: UILabel!
    let buttonHandler: ButtonHandler
    init (questionField: UILabel,
          buttonHandler: ButtonHandler) {
        self.buttonHandler = buttonHandler
    }
}
