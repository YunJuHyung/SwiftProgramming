//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by 윤주형 on 4/6/24.
//  Copyright © 2024 Angela Yu. All rights reserved.
//

import Foundation
import UIKit

struct CalculatorBrain {
    
    var bmi: BMI?

    func getBMIValue() -> String {
        let bmiTo1DecimalPlace = String(format: "%.1f", bmi?.value ?? 0.0)
            //?? 병합연산자를 통해 bmi값이 nil인경우 0.0을 기본값으로 할수 있어서
            //if문과 else문 없이 구문을 더 명확하게 표기할 수 있다.
            return bmiTo1DecimalPlace
    }
    
    func getAdvice() -> String {
        return bmi?.advice ?? "No advice"
    }
    
    func getColor()  -> UIColor {
        return bmi?.color ?? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
     
    mutating func calculateBMI(height: Float, weight: Float){
        let bmiValue = weight / (height * height)
        let colors = (underweight : #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1), healthy : #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1), overweight : #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1))
        
        if bmiValue < 18.5 {
            bmi = BMI(value: bmiValue, advice: "Eat more pies!", color: colors.underweight )
        }else if bmiValue < 24.9{
            bmi = BMI(value: bmiValue, advice: "Fit as a fiddle.", color: colors.healthy)
        }else {
            bmi = BMI(value: bmiValue, advice: "Eat less pies!", color: colors.overweight)
        }
    }
    
    
    
}
