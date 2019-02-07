//
//  Enums.swift
//  EnhanceQuizStarter
//
//  Created by nikko444 on 2019-01-30.
//  Copyright © 2019 Treehouse. All rights reserved.
//

///To use with controlButton property of ButtonsHandler Class
enum ControlButtonCaptions: String {
    case nextQuestion = "Next Question"
    case playAgain = "Play Again!"
    case displayScore = "Show Score"
}

///To use with feedbackLabel propery of LablesHandler Class
enum FeedbackLabelCaptions: String {
    case correctAnswer = "That's correct!"
    case wrongAnswer = "Sorry, that's a miss..."
    case timeout = "Sorry! Time is out!"
}

///To use with answerButton property of ButtonsHandler Class while in Game Menu
enum GameMenuButtonsCaptions: String {
    case lightningMode = "Lighting Mode ⚡️"
    case normalMode = "Normal Mode 🤔"
}

///To use with questionLabel property of LabelsHandler Class while in Game Menu
enum GameMenuLabelsCaptions: String {
    case startMenu = "Choose your destiniy 😉"
}

///A helper enum to display score screen
enum ScoreScreen {
    case answerLabel(correct: Int, of: Int)
    case feedbackLabel(correct: Int, of: Int)
    
    func provide() -> String{
        switch self {
        case .answerLabel(let correct, let of): return "You got \(correct) out of \(of) correct!"
        case .feedbackLabel(let correct, let of): // Returns a different caption depending on
            let ratio: Double = Double(correct) / Double(of)
            if ratio >= 0.6 {
                return "Way to go!"
            } else {
                return "Give it one more shot"
            }
    
        }
    }
}
