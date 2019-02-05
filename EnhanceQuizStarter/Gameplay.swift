//
//  Gameplay.swift
//  EnhanceQuizStarter
//
//  Created by nikko444 on 2019-01-29.
//  Copyright © 2019 Treehouse. All rights reserved.
//
import UIKit
//import GameKit
import AudioToolbox

class Gameplay {
    private let trivia = TriviaProvider()
    private let labelHandler: LabelHandler
    private let buttonHandler: ButtonsHandler
    private let questionsPerRound: Int
    
    private var triviaToSet: TriviaModel
    private var correctAnswers: Int = 0
    private var questionsAsked = 0
    private var gameSound: SystemSoundID = 0
    
    init (labelHandler: LabelHandler,
          buttonHandler: ButtonsHandler,
          numberOfQuestionsPerRound: Int) {
        self.labelHandler = labelHandler
        self.buttonHandler = buttonHandler
        self.questionsPerRound = numberOfQuestionsPerRound
        self.triviaToSet = trivia.provide()
        
        let path = Bundle.main.path(forResource: "GameSound", ofType: "wav") //Looking up for path to GameSound.wav
        let soundUrl = URL(fileURLWithPath: path!) //Making the GameSound.wav URL
        AudioServicesCreateSystemSoundID(soundUrl as CFURL, &gameSound) //Assigning GameSound.wav URL to the address of SystemSoundID type variable
    }
    
    func setTriviaScreen () {
        questionsAsked += 1
        triviaToSet = trivia.provide()
        labelHandler.display(question: triviaToSet.question)
        buttonHandler.setButtons(for: triviaToSet)
        playGameStartSound()
    }
    
    func checkAnswer (_ sender: UIButton) {
        if triviaToSet.answer == sender.titleLabel?.text {
            correctAnswers += 1
            labelHandler.display(question: TriviaAnswerIs.correct.rawValue)
        } else {
            labelHandler.display(question: TriviaAnswerIs.wrong.rawValue)
        }
        buttonHandler.setControlButton(questionsPerRound: questionsPerRound, questionsAsked: questionsAsked)
        buttonHandler.buttonFeedBack(for: triviaToSet, sender)
    }
    
    func gameControl(_ sender: UIButton) { //TODO: HAS TO BE REWORKED NOT FOLLOWING THE GAME LOGIC
        nextRound()
           // loadNextRound(delay: 2)
    }
    
    private func playGameStartSound() {
        AudioServicesPlaySystemSound(gameSound)
    }
    
    private func nextRound() {
        if questionsAsked == questionsPerRound {
            
            // Game is over
           // displayScore()
        } else {
            // Continue game
            setTriviaScreen()
        }
    }
    
    private func loadNextRound(delay seconds: Int) {
        // Converts a delay in seconds to nanoseconds as signed 64 bit integer
        let delay = Int64(NSEC_PER_SEC * UInt64(seconds))
        // Calculates a time value to execute the method given current time and delay
        let dispatchTime = DispatchTime.now() + Double(delay) / Double(NSEC_PER_SEC)
        
        // Executes the nextRound method at the dispatch time on the main queue
        DispatchQueue.main.asyncAfter(deadline: dispatchTime) {
            self.nextRound()
        }
    }
}
