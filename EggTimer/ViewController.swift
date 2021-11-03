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
    var secondsPassed: Int = -1
    var cookTime: Int = -1
    var timer = Timer()
    
    @IBOutlet weak var TitleLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBAction func HardnessSelected(_ sender: UIButton) {
        TitleLabel.text = "Cooking"
        let hardness = sender.currentTitle ?? "Hard"
        timer.invalidate()
        
        progressBar.progress = 1.0
        self.cookTime = eggTimes[hardness]!
        self.secondsPassed = 0
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector:#selector(updateTimer), userInfo:nil, repeats: true)
    }
    
    @objc func updateTimer() {
        if self.secondsPassed < self.cookTime {
            let percent = Float(self.secondsPassed) / Float(self.cookTime)
            self.secondsPassed += 1
            
            progressBar.progress = percent
            
        } else {
            TitleLabel.text = "Done!"
            progressBar.progress = 1
        }
    }
}
