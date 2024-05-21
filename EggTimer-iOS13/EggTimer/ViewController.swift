//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var progressBar: UIProgressView!
    let eggTimes = ["Soft": 4, "Medium": 5, "Hard": 7]
    var secondPassed = 0
    var totalTime = 0
    var timer = Timer()
    
    //timer 를 즉시 인스턴스화해서 없을수도 있는 타이머에대한 불필요한 리소스를 사용하는 단점이 있다. + 옵셔널 타입으로 사용하는 방법또한 있다.
    
    override func viewDidLoad() {
        super.viewDidLoad()
        progressBar.progress = 0.0
    }
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        let hardness = sender.currentTitle!
        timer.invalidate()
        totalTime = eggTimes[hardness]!
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
    }
    
    @objc func updateCounter() {
        //example functionality
        if secondPassed < totalTime {
            secondPassed += 1
            titleLabel.text = ("\((totalTime + 1) - secondPassed) seconds egg to be your favor")
            progressBar.progress = Float(secondPassed) / Float(totalTime)
            
        }
        else {
            timer.invalidate()
            titleLabel.text = "DONE!"
            DispatchQueue.main.asyncAfter(deadline: .now() + 3){
                self.titleLabel.text = "How do you like your eggs?"
                self.progressBar.progress = 0
                self.secondPassed = 0
                
            }
            
        }
    }
}
