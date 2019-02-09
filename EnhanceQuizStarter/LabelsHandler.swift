//
//  LabelsHandler.swift
//  EnhanceQuizStarter
//
//  Created by nikko444 on 2019-01-30.
//  Copyright © 2019 Treehouse. All rights reserved.
//

import UIKit

class LabelsHandler {
    private let questionLabel: UILabel
    private let feedbackLabel: UILabel
    private let gameView: UIView //passed through to change the background color depending on the choice made
    
    init (questionLabel: UILabel,
          feedbackLabel: UILabel,
          view: UIView) {
        self.questionLabel = questionLabel
        self.feedbackLabel = feedbackLabel
        self.gameView = view
    }
    
    ///Getter methods, returns the feedback field to be used with CountdownTimer class instance init
    func getFeedbackLabel () -> UILabel {
        return self.feedbackLabel
    }
    
    ///Displays game menu
    func displayMenu() {
        questionLabel.text = GameMenuLabelsCaptions.startMenu.rawValue
        feedbackLabel.isHidden = true
    }
    
    ///Displays trivia question
    func display(question: String) {
        feedbackLabel.isHidden = true
        gameView.backgroundColor = UIColor.GameColor.defaultScreenColor
        questionLabel.text = question
    }
    
    ///Sets the screen for correct answer
    func displayCorrect() {
        gameView.backgroundColor = UIColor.GameColor.correctAnswerColor
        feedbackLabel.text = FeedbackLabelCaptions.correctAnswer.rawValue
        feedbackLabel.isHidden = false
    }
    
    ///Sets the screen for wrong answer
    func displayWrong () {
        gameView.backgroundColor = UIColor.GameColor.wrongAnswerColor
        feedbackLabel.text = FeedbackLabelCaptions.wrongAnswer.rawValue
        feedbackLabel.isHidden = false
    }
    
    ///Sets screen when the time expires
    func displayTimeout () {
        gameView.backgroundColor = UIColor.GameColor.wrongAnswerColor
        feedbackLabel.text = FeedbackLabelCaptions.timeout.rawValue
        feedbackLabel.isHidden = false
    }
    
    ///Sets score screen
    func displayScore (correctAnswers: Int, questionsAsked: Int) {
        questionLabel.text = ScoreScreen.answerLabel(correct: correctAnswers, of: questionsAsked).provide()
        feedbackLabel.text = ScoreScreen.feedbackLabel(correct: correctAnswers, of: questionsAsked).provide()
        gameView.backgroundColor = UIColor.GameColor.defaultScreenColor
        feedbackLabel.isHidden = false
    }
}
