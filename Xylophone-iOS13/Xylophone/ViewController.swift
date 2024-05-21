//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation //오디오와 상호작용하는 라이브러리

class ViewController: UIViewController {
    
    var player: AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func keyPressed(_ sender: UIButton) {
        print("\(sender.currentTitle!) Start")
        sender.alpha = 0.5
        playSound(soundName: sender.currentTitle!)
        
        //0.2초 후에 코드 실행을 예약합니다
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                //지연이후 "End"를 출력합니다
            print("\(sender.currentTitle!) End")
            sender.alpha = 1
            }
    }
    
    func playSound(soundName: String) {
        let url = Bundle.main.url(forResource: soundName, withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
                
      }
}


