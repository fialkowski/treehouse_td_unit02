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
    private var triviaToSet: TriviaModel // A temp trivia to use for a screen setup and the answer check
    private let trivia = TriviaProvider() // Provides a trivia and stores it to the triviaToSet variable
    private let labelsHandler: LabelsHandler //A helper class to manage Labels
    private let buttonsHandler: ButtonsHandler //A helper class to manage Buttons
    private let questionsPerRound: Int //
    
    private var correctAnswers: Int = 0
    private var questionsAsked: Int = 0
    private var gameSound: SystemSoundID = 0
    
    private var lightingModeTimeout: Double
    private var lightingModeTrigger: Bool = false
    private var lightningTimer: Timer?
    
    init (labelsHandler: LabelsHandler,
          buttonsHandler: ButtonsHandler,
          numberOfQuestionsPerRound: Int,
          lightningModeTimeout: Double) {
        self.labelsHandler = labelsHandler
        self.buttonsHandler = buttonsHandler
        self.questionsPerRound = numberOfQuestionsPerRound
        self.triviaToSet = TriviaModel(question: "initializing", answer: "initializing", option1: "initializing") //I know it's not the best prctice
        self.lightingModeTimeout = lightningModeTimeout
        
        let path = Bundle.main.path(forResource: "GameSound", ofType: "wav") //Looking up for path to GameSound.wav
        let soundUrl = URL(fileURLWithPath: path!) //Making the GameSound.wav URL
        AudioServicesCreateSystemSoundID(soundUrl as CFURL, &gameSound) //Assigning GameSound.wav URL to the address of SystemSoundID type variable
    }
    
    ///Public methods///
    
    ///Displays game menu
    func displayMenu() {
        correctAnswers = 0 // resetting correctAnswers counter variable
        questionsAsked = 0 // resetting a total questions asked counter variable
        lightingModeTrigger = false // if set to true triggers a certain methods to run a lightnig mode
        labelsHandler.displayMenu()
        buttonsHandler.setStartMenuButtons()
    }
    
    ///Checks if the sender button caption mathces the answer
    func checkAnswer (_ sender: UIButton) {
        if lightingModeTrigger == true {
            lightningTimer?.invalidate()
        }
        if sender.titleLabel?.text == GameMenuButtonsCaptions.lightningMode.rawValue {
            lightingModeTrigger = true
            displayTrivia()
        } else if sender.titleLabel?.text == GameMenuButtonsCaptions.normalMode.rawValue {
            lightingModeTrigger = false
            displayTrivia()
        } else if sender.titleLabel?.text == triviaToSet.answer {
            correctAnswers += 1
            labelsHandler.displayCorrect()
            buttonsHandler.setControlButton(questionsPerRound: questionsPerRound, questionsAsked: questionsAsked)
            buttonsHandler.buttonFeedBack(for: triviaToSet, sender)
        } else {
            labelsHandler.displayWrong()
            buttonsHandler.setControlButton(questionsPerRound: questionsPerRound, questionsAsked: questionsAsked)
            buttonsHandler.buttonFeedBack(for: triviaToSet, sender)
        }
    }
    
    ///Controlling game depending on the control button captions
    func gameControl(_ sender: UIButton) {
        switch sender.titleLabel?.text { // Switching on control button captions, through enum
            case ControlButtonCaptions.displayScore.rawValue: self.displayScore()
            case ControlButtonCaptions.playAgain.rawValue: self.displayMenu()
            default: self.displayTrivia()
        }
    }
    
    ///Private methods///
    
    ///Displays trivia
    @objc private func displayTrivia () {
        questionsAsked += 1
        triviaToSet = trivia.provide()
        labelsHandler.display(question: triviaToSet.question)
        buttonsHandler.setButtons(for: triviaToSet)
        playGameSound()
        if lightingModeTrigger == true { // if in lighting mode starts the timer
            lightningTimer = Timer.scheduledTimer(timeInterval: lightingModeTimeout, target: self, selector: #selector(showTimeout), userInfo: nil, repeats: false)
        }
    }
    
    ///Displays timout notification and triggers the next screen depending on the game state.
    @objc private func showTimeout() {
        labelsHandler.displayTimeout()
        buttonsHandler.setTimeoutButtons()
        if questionsAsked == questionsPerRound { //If all the questions asked triggers displayScore method
            Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(displayScore), userInfo: nil, repeats: false)
        } else { //Otherwise triggers the displayTrivia method
            Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(displayTrivia), userInfo: nil, repeats: false)
        }
    }
    
    
    ///Displays Score screen
    @objc private func displayScore() {
        buttonsHandler.setScoreScreen()
        labelsHandler.displayScore(correctAnswers: correctAnswers, questionsAsked: questionsAsked)
    }
    
    ///Plays sound
    private func playGameSound() {
        AudioServicesPlaySystemSound(gameSound)
    }
    
}
