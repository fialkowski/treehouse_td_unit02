//
//  GameSound.swift
//  EnhanceQuizStarter
//
//  Created by nikko444 on 2019-02-08.
//  Copyright © 2019 SGT Inc. All rights reserved.
//

import AudioToolbox

//I didn't put any explanation here since the code seems to me quite self explanatory

class GameSound {
    private var gameStart: SystemSoundID = 0
    private var wrong: SystemSoundID = 0
    private var correct: SystemSoundID = 0
    
    init () {
        loadGameStartSound()
        loadWrongSound()
        loadCorrectSound()
    }
    
    private func loadGameStartSound() {
        let path = Bundle.main.path(forResource: "GameStart", ofType: "wav") //Looking up for path to GameSound.wav
        let soundUrl = URL(fileURLWithPath: path!) //Making the GameSound.wav URL
        AudioServicesCreateSystemSoundID(soundUrl as CFURL, &gameStart) //Assigning GameSound.wav URL to the address of SystemSoundID type variable
    }
    
    private func loadWrongSound() {
        let path = Bundle.main.path(forResource: "WrongAnswer", ofType: "mp3") //Looking up for path to GameSound.wav
        let soundUrl = URL(fileURLWithPath: path!) //Making the GameSound.wav URL
        AudioServicesCreateSystemSoundID(soundUrl as CFURL, &wrong) //Assigning GameSound.wav URL to the address of SystemSoundID type variable
    }
    
    private func loadCorrectSound() {
        let path = Bundle.main.path(forResource: "CorrectAnswer", ofType: "mp3") //Looking up for path to GameSound.wav
        let soundUrl = URL(fileURLWithPath: path!) //Making the GameSound.wav URL
        AudioServicesCreateSystemSoundID(soundUrl as CFURL, &correct) //Assigning GameSound.wav URL to the address of SystemSoundID type variable
    }
    
    func playStart () {
        AudioServicesPlaySystemSound(gameStart)
    }
    
    func playWrong () {
        AudioServicesPlaySystemSound(wrong)
    }
    
    func playCorrect () {
        AudioServicesPlaySystemSound(correct)
    }
}
