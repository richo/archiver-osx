//  ViewController.swift
//  archiver-osx
//
//  Created by richö butts on 2/3/19.
//  Copyright © 2019 richö butts. All rights reserved.
//

import Cocoa
import Alamofire

var URL_BASE = "https://onatopp.psych0tik.net"

class ViewController: NSViewController {
    @IBOutlet weak var password: NSSecureTextField!
    @IBOutlet weak var email: NSTextField!
    
    @IBAction func loginButton(_ sender: Any) {
        let errorMessage: String = String()
        // NSLog("Trying to login with: %@:%@", email.stringValue, password.stringValue)
        
        var url = URLComponents(string: URL_BASE)!
        url.path = "/json/signin"
        
        let parameters = [
            "email": email.stringValue,
            "password": password.stringValue,
        ]
        let res = AF.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default)
            .responseJSON { closureResponse in
                if let json = closureResponse.result.value as? [String: Any] {
                    // Figure out how to pattern match on either a Token or Error key
                } else {
                    NSLog("Login failed.")
                }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override var representedObject: Any? {
        didSet {
            // Update the view, if already loaded.
        }
    }
}

