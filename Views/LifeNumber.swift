//
//  LifeNumber.swift
//  生命靈數
//
//  Created by 王昱淇 on 2021/12/10.
//

import Foundation
import UIKit


class LifeNumber {
    let LifeNNumberNames = LifeNNumberName.allCases
    let zodiacSigns = ZodiacSign.allCases
    let dateFormatter = DateFormatter()
   
    func calculateLifeNunmber(birthday: Date) -> Int {
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
    
    func creatLifeNumberName(lifeNumber: Int) -> String {
        return "生命靈數: \(lifeNumber)  \(LifeNNumberNames[lifeNumber])"
    }
    
    func calculateInbornNumber(birthday: Date) -> (Int, Int) {
        dateFormatter.dateFormat = "yMd"
        let numberString = dateFormatter.string(from: birthday)
        var sum = 0
       
        
        for character in numberString {
            let number = Int(String(character))!
            sum += number
        }
        let number1: Int = sum / 10
        let number2: Int = sum % 10
 
        return (number1, number2)
    }
    
    func calculateBirthdayNumber(birthday: Date) -> Int {
        dateFormatter.dateFormat = "dd"
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
    
    func calculateZodiacSignNumber(birthday: Date) -> (Int, String) {
        let dateComponents = Calendar.current.dateComponents(in: TimeZone.current, from: birthday)
        let month = dateComponents.month!
        let day = dateComponents.day!
        
        if month == 3 && day >= 21 || month == 4 && day <= 19 {
            return (1, "\(zodiacSigns[0])")
        } else if month == 4 && day >= 20 || month == 5 && day <= 20 {
            return (2, "\(zodiacSigns[1])")
        } else if month == 5 && day >= 21 || month == 6 && day <= 21 {
            return (3, "\(zodiacSigns[2])")
        } else if month == 6 && day >= 22 || month == 7 && day <= 22 {
            return (4, "\(zodiacSigns[3])")
        } else if month == 7 && day >= 23 || month == 8 && day <= 22 {
            return (5, "\(zodiacSigns[4])")
        } else if month == 8 && day >= 23 || month == 9 && day <= 22 {
            return (6, "\(zodiacSigns[5])")
        } else if month == 9 && day >= 23 || month == 10 && day <= 22 {
            return (7, "\(zodiacSigns[6])")
        } else if month == 10 && day >= 23 || month == 11 && day <= 21 {
            return (8, "\(zodiacSigns[7])")
        } else if month == 11 && day >= 22 || month == 12 && day <= 21 {
            return (9, "\(zodiacSigns[8])")
        } else if month == 12 && day >= 22 || month == 1 && day <= 19 {
            return (10, "\(zodiacSigns[9])")
        } else if month == 1 && day >= 20 || month == 2 && day <= 18 {
            return (11, "\(zodiacSigns[10])")
        } else if month == 2 && day >= 19 || month == 3 && day <= 20 {
            return (12, "\(zodiacSigns[11])")
        
        } else {
            return (0, "error")
        }
    }
}

enum LifeNNumberName: Int, CaseIterable {
    case   無, 開創, 協調, 創意, 務實, 自由, 關懷, 探究, 權威, 智慧
   
}


enum ZodiacSign: Int, CaseIterable {
    case Aries_牡羊座, Taurus_金牛座, Gemini_雙子座, Cancer_巨蟹座, Leo_獅子座, Virgo_處女座, Libra_天秤座, Scorpio_天蠍座, Sagittarius_射手座, Capricorn_摩羯座, Aquarius_水瓶座, Pisces_雙魚座
}
