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
        "Fifth Fact":
            ["option1":"First Option",
             "option2":"Second Option",
             "option3":"Third Option",
             "option4":"Fourth Option",
             "answer":"option4"]
    ]
    
    ///This function return a unique random trivia from the trivia dictionary declared in this struct. Unless it randomly iterates through the whole dictionary.
    mutating func uniqueRandomTrivia () -> (question: String, options: [String], correctAnswer: String) {
        var lastTriviaPresented = String() // A temporary variable to store a last presented fact in a unique sequence. This variable is used to prevent function returning two very same question when the unique sequence restarts from a scratch.
        var bufferTrivia = randomTrivia() // A temporary variable to store a random trivia
        if presentedTrivia.count == trivia.count { // This condition checks if we have displayed all of the trivia dictionary elements i.e. the qunique sequence is over.
            lastTriviaPresented = presentedTrivia.removeLast() //Right before flushing the presentedTrivia questions array we store the very last question to make shure the first question of a new sequence doesn't repeat the last question of the finished sequence
            presentedTrivia = [String]() //flushes the presentedTrivia question array to start over the unique sequence
        }
        if !lastTriviaPresented.isEmpty { // This can be "not empty" only when we restart the sequence.
            if lastTriviaPresented == bufferTrivia.question { // This condition checkes if a randomly generated trivia from bufferTrivia variable is the same as the last one from the finished unique sequence of trivia.
                var protectionVariable: Int = trivia.count * 2 //Infinite loop protection
                repeat { //If the aforementioned condition is met we loop through this cycle until a unique trivia is picked
                    protectionVariable -= 1
                    bufferTrivia = randomTrivia()
                } while lastTriviaPresented == bufferTrivia.question && protectionVariable > 0
                presentedTrivia.append(bufferTrivia.question)
                return (bufferTrivia.question, bufferTrivia.options, bufferTrivia.correctAnswer)
            }
        }
        if presentedTrivia.contains(bufferTrivia.question) { //This condition checks if a randomly generated trivia key from bufferTrivia variable is the same as either of the presentedTrivia array.
            var protectionVariable: Int = trivia.count * 2 // Infinite loop protection
            repeat {
                protectionVariable -= 1
                bufferTrivia = randomTrivia()
            } while presentedTrivia.contains(bufferTrivia.question) && protectionVariable > 0
            presentedTrivia.append(bufferTrivia.question)
            return (bufferTrivia.question, bufferTrivia.options, bufferTrivia.correctAnswer)
        }
        //if none of the above conditions met we return a generated random trivia.
        presentedTrivia.append(bufferTrivia.question)
        return (bufferTrivia.question, bufferTrivia.options, bufferTrivia.correctAnswer)
    }
    
    ///This private function returns a random fact from the trivia dictionary
    private func randomTrivia () -> (question: String, options: [String], correctAnswer: String) {
        guard var randomTrivia = trivia.randomElement() else {
            return (question: "Oh, darn! Looks like the \"trivia\" dictionary is empty or corrupt :(",
                    options: ["trivia dictionary",
                              "structure is corrupt",
                              "or empty",
                              "what a shame..."],
                    correctAnswer: "")
        }
        let question = randomTrivia.key
        let correctAnswer = randomTrivia.value[randomTrivia.value.removeValue(forKey: "answer")!]!//FORCE UNWRAPPING SINCE EXCEPTIONS ARE OUT OF SCOPE YET
        let options = [String](randomTrivia.value.values)
        
        if correctAnswer.isEmpty || options.count < 2 || options.count > 6 { //Emulating try-catch pattern here without actual operators
            return (question: "Something is wrong in the TriviaProvider struct",
                    options: ["The number of answers",
                              "in the aforementioned struct",
                              "doesn't match the game logic",
                              "or answer wasn't presented"],
                    correctAnswer: "")
        } else {
            return (question: question,
                    options: options,
                    correctAnswer: correctAnswer)
        }
    }

}
