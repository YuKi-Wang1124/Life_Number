//
//   InbornNumber.swift
//  生命靈數
//
//  Created by 王昱淇 on 2021/12/13.
//

import Foundation

class InbornNumber {
    
    func calculateLifeNunmber(birthday: Date) -> Int {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yMd"
        var numberString = dateFormatter.string(from: birthday)
        var sum = 0
        
        repeat {
            sum = 0
            for character in numberString {
                let number = Int(String(character))!
                sum += number
            }
            numberString = "\(sum)"
        } while sum > 9
        
        return sum
    }
}
