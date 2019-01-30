//
//  TriviaProvider.swift
//  EnhanceQuizStarter
//
//  Created by nikko444 on 2019-01-29.
//  Copyright © 2019 Treehouse. All rights reserved.
//
import GameKit

struct TriviaProvider {
    private var presentedTrivia = [String]() //an array of keys for displayed trivia; used in dublicate elimination logic.
    let trivia: [String:[String:String]] = [
        "What is the capital of Italy?":
            ["option1":"Rome",
             "option2":"Venice",
             "option3":"Milan",
             "option4":"Florence",
             "answer":"option1"],
        "Is Vatican City an independent State?":
            ["option1":"Yes",
             "option2":"No",
             "answer":"option1"],
        "A large part of nowadays Germany was once de-facto governed by USSR":
            ["option1":"Yes",
             "option2":"No",
             "answer":"option1"],
        "Which country has all of the drugs decriminalized?":
            ["option1":"Netherlands",
             "option2":"New Zeland",
             "option3":"Portugal",
             "option4":"Canada",
              "answer":"option3"],
        "Fifth Fact":["option1":"First Option",
                       "option2":"Second Option",
                       "option3":"Third Option",
                       "option4":"Fourth Option",
                       "answer":"option4"]
    ]
    
    ///This function return a unique random trivia from the trivia dictionary declared in this struct. After a number of this function calls even to the number of members in the trivia dictionary you get a unique sequence where none of the elements repeat itself.
    mutating func uniqueRandomTrivia () -> (key: String, value: [String:String]) {
        var lastTriviaPresented = String() // A temporary variable to store a last presented fact in a unique sequence. This variable is used to prevent function returning two very same question when the unique sequence restarts from a scratch.
        var bufferTrivia = randomTrivia() // A temporary variable to store a random fact
        if presentedTrivia.count == trivia.count { // This condition checks if we have displayed all of the trivia dictionary elements i.e. the qunique sequence is over.
            lastTriviaPresented = presentedTrivia.removeLast() //Right before flushing the presentedTrivia key array we store the very last key in this variable, to make shure the first element of a new sequence doesn't repeat the last element of the finished sequence
            presentedTrivia = [String]() //flushes the presentedTrivia key array to start the unique sequence over
        }
        if !lastTriviaPresented.isEmpty { // This can be "not empty" only when we restart the sequence.
            if lastTriviaPresented == bufferTrivia.key { // This condition checkes if a randomly generated trivia key from bufferTrivia variable is the same as the last one from the finished unique sequence of trivia.
                var protectionVariable: Int = trivia.count * 2 //Infinite loop protection
                repeat { //If the aforementioned condition is met we loop through this cycle until a non-matching trivia is picked
                    protectionVariable -= 1
                    bufferTrivia = randomTrivia()
                } while lastTriviaPresented == bufferTrivia.key && protectionVariable > 0
                presentedTrivia.append(bufferTrivia.key)
                return (bufferTrivia.key, bufferTrivia.value)
            }
        }
        if presentedTrivia.contains(bufferTrivia.key) { //This condition checks if a randomly generated trivia key from bufferTrivia variable is the same as either of the presentedTrivia array.
            var protectionVariable: Int = trivia.count * 2 // Infinite loop protection
            repeat {
                protectionVariable -= 1
                bufferTrivia = randomTrivia()
            } while presentedTrivia.contains(bufferTrivia.key) && protectionVariable > 0
            presentedTrivia.append(bufferTrivia.key)
            return (bufferTrivia.key, bufferTrivia.value)
        }
        //if none of the above conditions met we return a generated random trivia.
        presentedTrivia.append(bufferTrivia.key)
        return (bufferTrivia.key, bufferTrivia.value)
    }
    
    ///This private function returns a random fact from the trivia dictionary
    private func randomTrivia () -> (key: String, value: [String:String]) {
        guard let randomTrivia = trivia.randomElement() else {
            return (key: "Oh, darn! Looks like the \"trivia\" dictionary is empty or corrupt :(",
                    value: ["option1":"Get away with what we have"])
        }
        return (key: randomTrivia.key, value: randomTrivia.value)
    }
}
