//
//  Gameplay.swift
//  EnhanceQuizStarter
//
//  Created by nikko444 on 2019-01-29.
//  Copyright © 2019 Treehouse. All rights reserved.
//
import UIKit
import AudioToolbox

class Gameplay {
    var trivia = TriviaProvider()
    let labelHandler: LabelHandler
    let buttonHandler: ButtonHandler
    let questionsPerRound: Int
    
    init (labelHandler: LabelHandler,
          buttonHandler: ButtonHandler,
          numberOfQuestionsPerRound: Int) {
        self.labelHandler = labelHandler
        self.buttonHandler = buttonHandler
        self.questionsPerRound = numberOfQuestionsPerRound
    }
    
    func setTriviaScreen () {
        let triviaToSet = trivia.provide()
        labelHandler.display(question: triviaToSet.question)
        buttonHandler.setButtons(for: triviaToSet)
    }
    
}
