//
//  TriviaModel.swift
//  EnhanceQuizStarter
//
//  Created by nikko444 on 2019-01-31.
//  Copyright © 2019 SGT Inc.
//

///stores trivia question, and answer options
struct TriviaModel {
    let question: String
    let answer: String
    let option1: String
    let option2: String? //Set to optional to store nil, in case a 2 answer trivia
    let option3: String? //Set to optional to store nil, in case of 2 or 3 answer trivia
    
    /// Initializer for a 2 option trivia
    init (question: String, answer: String, option1: String) {
        self.question = question
        self.answer = answer
        self.option1 = option1
        self.option2 = nil
        self.option3 = nil
    }
    
    /// Initializer for a 3 option trivia
    init (question: String, answer: String, option1: String, option2: String) {
        self.question = question
        self.answer = answer
        self.option1 = option1
        self.option2 = option2
        self.option3 = nil
    }
    
    /// Initializer for a 4 option trivia
    init (question: String, answer: String, option1: String, option2: String, option3: String) {
        self.question = question
        self.answer = answer
        self.option1 = option1
        self.option2 = option2
        self.option3 = option3
    }
}
