//  ViewController.swift
//  archiver-osx
//
//  Created by richö butts on 2/3/19.
//  Copyright © 2019 richö butts. All rights reserved.
//

import Cocoa

var URL_BASE = "https://onatopp.psych0tik.net"

class ViewController: NSViewController {
    @IBOutlet weak var username: NSTextField!
    @IBOutlet weak var password: NSSecureTextField!
    
    let defaultSession = URLSession(configuration: .default)
    var dataTask: URLSessionDataTask?
    
    @IBAction func loginButton(_ sender: Any) {
        let errorMessage: String = String()
        NSLog("Trying to login with: %@:%@", username.stringValue, password.stringValue)
        
        var url = URLComponents(string: URL_BASE)!
        url.path = "/json/login"
        
        var request = URLRequest(url: url.url!)
        request.httpMethod = "POST"
        request.setValue("application/x-www-form-urlencoded; charset=utf-8", forHTTPHeaderField: "Content-Type")
        request.HTTPBody = postData.dataUsingEncoding(NSUTF8StringEncoding)
        var connection = NSURLConnection(request: request, delegate: nil, startImmediately: true)
       
            dataTask = defaultSession.dataTask(with: url) { data, response, error in
                defer { self.dataTask = nil }
                
                if let error = error {
                    print("Got error:", error)
                } else if let data = data,
                    let response = response as? HTTPURLResponse,
                    response.statusCode == 200 {
                    print("Got login:", data)
                }
            }

            dataTask?.resume()
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

