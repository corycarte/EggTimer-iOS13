//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
//    let eggTimes = ["Soft": 300, "Medium": 420, "Hard": 720]
    let eggTimes = ["Soft": 3, "Medium": 4, "Hard": 7]
    var secondsRemaining: Int = -1
    var timer = Timer()
    
    @IBOutlet weak var TitleLabel: UILabel!
    
    @IBAction func HardnessSelected(_ sender: UIButton) {
        let hardness = sender.currentTitle ?? "Hard"
        timer.invalidate()
        
        self.secondsRemaining = eggTimes[hardness]!
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector:#selector(updateTimer), userInfo:nil, repeats: true)
    }
    
    @objc func updateTimer() {
        if self.secondsRemaining > 0 {
            let message = "\(secondsRemaining) seconds."
            print(message)
//            TitleLabel.text = message
            secondsRemaining -= 1
        } else {
            TitleLabel.text = "Done!"
        }
    }
}
