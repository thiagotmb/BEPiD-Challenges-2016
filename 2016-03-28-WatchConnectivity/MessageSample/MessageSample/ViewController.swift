//
//  ViewController.swift
//  MessageSample
//
//  Created by Thiago-Bernardes on 3/28/16.
//  Copyright © 2016 TB. All rights reserved.
//

import UIKit
import WatchConnectivity
class ViewController: UIViewController, WCSessionDelegate {

    @IBOutlet weak var countLabel: UILabel!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var session: WCSession!
        if WCSession.isSupported() {
            session = WCSession.defaultSession()
            session.delegate = self
            session.activateSession()
            countLabel.text = "Waiting"
        }
    }

    func session(session: WCSession, didReceiveMessage message: [String : AnyObject]) {
        dispatch_async(dispatch_get_main_queue(), {
            if let count = message["count"] as? Int {
                self.countLabel.text = "\(count)"
            }
        
        })
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

