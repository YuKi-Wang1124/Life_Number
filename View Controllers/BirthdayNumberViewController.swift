//
//  BirthdayNumberViewController.swift
//  生命靈數
//
//  Created by 王昱淇 on 2021/12/13.
//

import UIKit
import WebKit

class BirthdayNumberViewController: UIViewController {

    var birthday: Date!
    var birthdayNumber: Int!
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        updateUI()
    }
    
    func updateUI() {
      
        title = "生日數：\(Int(birthdayNumber))"
        
        if let url = URL(string: "https://www.ifreesite.com/numerology/b\(Int(birthdayNumber)).htm") {
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
