//
//  LabelHandler.swift
//  EnhanceQuizStarter
//
//  Created by nikko444 on 2019-01-30.
//  Copyright © 2019 Treehouse. All rights reserved.
//

import UIKit

class LabelHandler {
    private let informationLabel: UILabel
    init (informationLabel: UILabel) {
        self.informationLabel = informationLabel
    }
    
    func display(question: String) {
        informationLabel.text = question
    }
}
