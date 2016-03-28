//
//  ViewController.swift
//  UserInfoSample
//
//  Created by Thiago-Bernardes on 3/28/16.
//  Copyright © 2016 TB. All rights reserved.
//

import UIKit
import WatchConnectivity
class ViewController: UIViewController, WCSessionDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var session : WCSession
        
        if WCSession.isSupported() {
            
            session = WCSession.defaultSession()
            session.delegate = self
            session.activateSession()
            session.transferUserInfo(["helloUser":"My user info was arrived"])
            
            if let fileURL = NSBundle.mainBundle().URLForResource("appletv", withExtension: "jpg") {
                session.transferFile(fileURL, metadata: ["name" : "Apple TV"])
            } else {
                print("File not found")
            }
        }
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

