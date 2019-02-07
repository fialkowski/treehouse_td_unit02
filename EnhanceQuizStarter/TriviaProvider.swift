//
//  TriviaProvider.swift
//  EnhanceQuizStarter
//
//  Created by nikko444 on 2019-01-29.
//  Copyright © 2019 Treehouse. All rights reserved.
//
import GameKit

class TriviaProvider {
    private let trivia: [TriviaModel] = [ //An array of Trivia models
        TriviaModel(question: "What is the capital of Italy?",
                    answer: "Rome",
                    option1: "Venice",
                    option2: "Milan"),
        
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
                    option3: "Colombia"),
        
        TriviaModel(question: "Which city is the oldest?",
                    answer: "Mexico City",
                    option1: "Cape Town",
                    option2: "San Juan",
                    option3: "Sydney"),
        
        TriviaModel(question: "Which country was the first to allow women to vote in national elections?",
                    answer: "Poland",
                    option1: "United States",
                    option2: "Sweden"),
        
        TriviaModel(question: "Which of these countries won the most medals in the 2012 Summer Games?",
                    answer: "Great Britian",
                    option1: "France",
                    option2: "Germany",
                    option3: "Japan"),
        
        TriviaModel(question: "Which nation produces the most oil?",
                    answer: "Canada",
                    option1: "Russia",
                    option2: "Iraq"),
        
        TriviaModel(question: "Which country has most recently won consecutive World Cups in Soccer?",
                    answer: "Brazil",
                    option1: "Italy",
                    option2: "Argetina",
                    option3: "Spain"),
        
        TriviaModel(question: "Which of the following countries has the most residents?",
                    answer: "Nigeria",
                    option1: "Russia",
                    option2: "Iran",
                    option3: "Vietnam")
    ]
    
    private var usedTriviaIndexes: [Int] //An array to store a random index that was once picked
    
    init () {
        usedTriviaIndexes = [Int]()
    }
    
    /// Generates a unique array index to pick from the trivia[TriviaModel] array
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
        } while reGenerate //we repeat the loop if the generated index is unique
        usedTriviaIndexes.append(indexOfSelectedQuestion)
        return indexOfSelectedQuestion
    }
    
    ///Returns a random and unique TriviaModel from the trivia[TriviaModel] array
    func provide () -> TriviaModel {
        return trivia[randomQuestion()]
    }
    
}
