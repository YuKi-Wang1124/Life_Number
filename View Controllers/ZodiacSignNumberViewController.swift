//
//  ZodiacSignNumberViewController.swift
//  生命靈數
//
//  Created by 王昱淇 on 2021/12/13.
//

import UIKit
import WebKit

class ZodiacSignNumberViewController: UIViewController {
    
    var birthday: Date!
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        updateUI()
    }
    
    func updateUI() {
        let lifeNumber = LifeNumber()
        let number = lifeNumber.calculateZodiacSignNumber(birthday: birthday)
        title = "星座數：\(number.0) \(number.1) "
        if let url = URL(string: "https://www.ifreesite.com/numerology/d\(number.0).htm") {
            let request = URLRequest(url: url)
            webView.load(request)
        }
    }
    
    
    @IBAction func backAction(_ sender: UIBarButtonItem) {
        if webView.goBack() == nil {
            print("error")
        }
    }
    
    @IBAction func forwardAction(_ sender: UIBarButtonItem) {
        if webView.goForward() == nil {
            print("error")
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
