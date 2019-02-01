//
//  TriviaProvider.swift
//  EnhanceQuizStarter
//
//  Created by nikko444 on 2019-01-29.
//  Copyright © 2019 Treehouse. All rights reserved.
//
import GameKit

class TriviaProvider {
    let trivia: [TriviaModel] = [
        TriviaModel(question: "What is the capital of Italy?",
                    answer: "Rome",
                    option1: "Venice",
                    option2: "Milan",
                    option3: "Florence"),
        
        TriviaModel(question: "Is Vatican City an independent State?",
                    answer: "Yes",
                    option1: "No"),
        
        TriviaModel(question: "A large part of nowadays Germany was once de-facto governed by USSR",
                    answer: "True",
                    option1: "False"),
        
        TriviaModel(question: "Which country has all of the drugs decriminalized?",
                    answer: "Portugal",
                    option1: "Canada",
                    option2: "Netherlands",
                    option3: "Colombia")
    ]
    
    var usedTriviaIndexes: [Int]
    
    init () {
        usedTriviaIndexes = [Int]()
    }
    
    private func randomQuestion () -> Int {
        if trivia.count == usedTriviaIndexes.count { //Flushing buffer if the dublicate value is generated
            usedTriviaIndexes = []
        }
        var indexOfSelectedQuestion: Int //New unique index for a question
        var reGenerate: Bool //Flag for regenerating a random number
        repeat {
            reGenerate = false
            indexOfSelectedQuestion = GKRandomSource.sharedRandom().nextInt(upperBound: trivia.count)
            for check in usedTriviaIndexes { //Checking if the ramdom number was already picked
                if check == indexOfSelectedQuestion {
                    reGenerate = true
                }
            }
        } while reGenerate //we repeat the loop if the generated index is not unique
        usedTriviaIndexes.append(indexOfSelectedQuestion)
        return indexOfSelectedQuestion
    }
    
    func provide () -> TriviaModel {
        return trivia[randomQuestion()]
    }
    
}
