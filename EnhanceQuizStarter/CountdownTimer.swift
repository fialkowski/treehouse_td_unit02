//
//  CountdownTimer.swift
//  EnhanceQuizStarter
//
//  Created by nikko444 on 2019-02-08.
//  Copyright © 2019 SGT Inc. All rights reserved.
//

import UIKit

class CountdownTimer {
    
    var countdownTimer: Timer!
    var totalTime = 15 //Number of count-down seconds
    var timerLabel: UILabel
    
    init (timerLabel: UILabel) {
        self.timerLabel = timerLabel
    }
    
    func startTimer() {
        timerLabel.isHidden = false //Should be in scope of LabelsHandler Class, here for simplicity.
        countdownTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
    }
    
    func endTimer() {
        countdownTimer.invalidate()
        timerLabel.text = "00:15"
        totalTime = 15
    }

    @objc private func updateTime() {
        timerLabel.text = "\(timeFormatted(totalTime))"
        
        if totalTime != 0 {
            totalTime -= 1
        } else {
            endTimer()
        }
    }
    
    private func timeFormatted(_ totalSeconds: Int) -> String {
        let seconds: Int = totalSeconds % 60
        let minutes: Int = (totalSeconds / 60) % 60
        //     let hours: Int = totalSeconds / 3600
        return String(format: "%02d:%02d", minutes, seconds)
    }
    
    
}

