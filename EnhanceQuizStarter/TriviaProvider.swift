//
//  TriviaProvider.swift
//  EnhanceQuizStarter
//
//  Created by nikko444 on 2019-01-29.
//  Copyright © 2019 Treehouse. All rights reserved.
//
import GameKit

struct TirviaProvider {
    private var displayedTrivia = [Int]()
    let triva: [String:[String:String]] = [
        "First Fact":["option1":"First Option",
                      "option2":"Second Option",
                      "answer":"option2"],
        "Second Fact":["option1":"First Option",
                       "option2":"Second Option",
                       "option3":"Third Option",
                       "option4":"Fourth Option",
                       "answer":"option4"]
    ]
    
    func randomTrivia () -> (String, [String:String]) {
        
        
        return (trivia,)
    }
    
    private mutating func uniqueIndex () -> Int {
        var index: Int = 0
        if !displayedTrivia.isEmpty {
            
        } else {
            index = GKRandomSource.sharedRandom().nextInt(upperBound: triva.count)
            self.displayedTrivia.append(index)
        }
    }
}
