//
//  ResultViewController.swift
//  生命靈數
//
//  Created by 王昱淇 on 2021/12/9.
//

import UIKit
import WebKit

class ResultViewController: UIViewController {

    var birthday: Date!
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateUI()
       
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
    
    func updateUI() {
        let personalLifeNumber = LifeNumber()
        let number = personalLifeNumber.calculateLifeNunmber(birthday: birthday)
        
        //controller 的 property title 控制 navigation bar 的標題
        title = personalLifeNumber.creatLifeNumberName(lifeNumber: number)
        
        if let url = URL(string: "https://www.ifreesite.com/numerology/a\(number).htm") {
            let request = URLRequest(url: url)
            webView.load(request)
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
