//
//  InbornNumberViewController.swift
//  生命靈數
//
//  Created by 王昱淇 on 2021/12/13.
//

import UIKit
import WebKit

class InbornNumberViewController: UIViewController {
    
    var birthday: Date!
    @IBOutlet weak var webViewOne: WKWebView!
    let lifeNumber = LifeNumber()
  
    @IBOutlet weak var inbornNumberSegmentedControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    
        updateUI()
    }
    
    func updateUI() {
        let number = lifeNumber.calculateInbornNumber(birthday: birthday)
        
        inbornNumberSegmentedControl.setTitle("天賦數 \(number.0)", forSegmentAt: 0)
        inbornNumberSegmentedControl.setTitle("天賦數 \(number.1)", forSegmentAt: 1)
        title = "天賦數 \(number.0)、\(number.1)"

        if let url = URL(string: "https://www.ifreesite.com/numerology/c\(number.0).htm") {
            let request = URLRequest(url: url)
            webViewOne.load(request)
        }
  
    }
    
    @IBAction func backAction(_ sender: UIBarButtonItem) {
        if webViewOne.goBack() == nil {
            print("error")
        }
    }
    
    @IBAction func forwardAction(_ sender: UIBarButtonItem) {
        if webViewOne.goForward() == nil {
            print("error")
        }
    }
    
    @IBAction func changeContent(_ sender: UISegmentedControl) {
        let number = lifeNumber.calculateInbornNumber(birthday: birthday)
        switch sender.selectedSegmentIndex {
        case 0:
            if let url = URL(string: "https://www.ifreesite.com/numerology/c\(number.0).htm") {
                let request = URLRequest(url: url)
                webViewOne.load(request)
            }
        case 1:
            if let url = URL(string: "https://www.ifreesite.com/numerology/c\(number.1).htm") {
                let request = URLRequest(url: url)
                webViewOne.load(request)
            }
        default:
            break
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

}
