//
//  BirthdayViewController.swift
//  生命靈數
//
//  Created by 王昱淇 on 2021/12/8.
//

import UIKit

class BirthdayViewController: UIViewController {
    
    @IBOutlet weak var datePicker: UIDatePicker!

    @IBOutlet weak var lifeNumberLabel: UILabel!
    @IBOutlet weak var zodiacSignNumberLabel: UILabel!
    @IBOutlet weak var inbornNumberLabel: UILabel!
    @IBOutlet weak var birthdayNumberLabel: UILabel!
  

    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
    @IBAction func changeText(_ sender: Any) {
        let birthday = datePicker.date
        let lifeNumber = LifeNumber()
        let number = lifeNumber.calculateLifeNunmber(birthday: birthday)
        let inbornNumber = lifeNumber.calculateInbornNumber(birthday: birthday)
        let birthdayNumber = lifeNumber.calculateBirthdayNumber(birthday: birthday)
        let zodiacSign = lifeNumber.calculateZodiacSignNumber(birthday: birthday)
        
        lifeNumberLabel.text = "生命靈數：\(number)"
        zodiacSignNumberLabel.text = "星座數： \(zodiacSign.0) \(zodiacSign.1)"
        inbornNumberLabel.text = "天賦數： \(inbornNumber.0)、\(inbornNumber.1)"
        birthdayNumberLabel.text = "生日數： \(birthdayNumber)"
        
    }
    

    @IBSegueAction func showResult(_ coder: NSCoder) -> ResultViewController? {
        let controller = ResultViewController(coder: coder)
        controller?.birthday = datePicker.date
        return controller
    }
    
    @IBSegueAction func showZodiacSignResult(_ coder: NSCoder) -> ZodiacSignNumberViewController? {
        let controller = ZodiacSignNumberViewController(coder: coder)
        controller?.birthday = datePicker.date
        return controller
    }
    
    @IBSegueAction func showInbornNumberResult(_ coder: NSCoder) -> UIViewController? {
        let controller = InbornNumberViewController(coder: coder)
        controller?.birthday = datePicker.date
        return controller
    }
    
    
    @IBSegueAction func showBirthdayNumberResult(_ coder: NSCoder) -> BirthdayNumberViewController? {
        let controller = BirthdayNumberViewController(coder: coder)
        controller?.birthday = datePicker.date
        let lifeNumber = LifeNumber()
        controller?.birthdayNumber = lifeNumber.calculateBirthdayNumber(birthday: datePicker.date)
        return controller
    }
    
    
}
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


