//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {
    
    var calculatorBrain = CalculatorBrain()
    
    @IBOutlet weak var heigthLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func heigtSliderChanged(_ sender: UISlider) {
        let height = String(format: "%.2f", sender.value)
        heigthLabel.text = "\(height)m"
    }
    
    @IBAction func weightSliderChanged(_ sender: UISlider) {
        let weight = String(format: "%.0f", sender.value)
        weightLabel.text = "\(weight)Kg"
    }
    @IBAction func calculatePressed(_ sender: UIButton) {
        let height = heightSlider.value
        let weight = weightSlider.value
        
        calculatorBrain.calculateBMI(height: height, weight: weight)
        
        //신체질량지수(BMI) = 체중(kg) / [신장(m)]2
        
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
        
        
    }
    
    // self.performSegue가 호출될때 실행되는 메서드
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //segue.destination 속성은 기본적으로 UIViewController 타입을 가지고 있습니다.
        //class ResultViewController: UIViewController
        //as! 연산자를 통해서 강제 타입 (다운) 캐스팅을 합니다
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.bmiValue = calculatorBrain.getBMIValue()
            destinationVC.advice = calculatorBrain.getAdvice()
            destinationVC.color = calculatorBrain.getColor()
        }
    }
    
    
}

