//
//  Number.swift
//  toss_MVC
//
//  Created by 장창순 on 09/07/2020.
//  Copyright © 2020 AnAppPerTwoWeeks. All rights reserved.
//

import UIKit

@objcMembers class Number: NSObject {
    
    dynamic var currentNumber = "0"
    
    func updateNumber(_ sender: Int) {
        switch sender {
        case 9:
            currentNumber = "0"
        case 10:
            if currentNumber == "0" {
                break
            } else {
                currentNumber += "0"
            }
        case 11:
            if currentNumber == "0" || currentNumber.count == 1 {
                currentNumber = "0"
            } else {
                currentNumber.removeLast()
            }
        default:
            if currentNumber == "0" {
                currentNumber = String(sender + 1)
            } else {
                currentNumber += String(sender + 1)
            }
        }
    }
    
    func setMaxNum(_ number: String) {
        currentNumber = number
    }
}
