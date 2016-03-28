//
//  ViewController.swift
//  ApplicationContextSample
//
//  Created by Thiago-Bernardes on 3/28/16.
//  Copyright © 2016 TB. All rights reserved.
//

import UIKit
import WatchConnectivity

class ViewController: UIViewController {

    var session: WCSession!
    
    @IBOutlet weak var receivedNameLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if WCSession.isSupported() {
            
            session = WCSession.defaultSession()
            session.delegate = self
            session.activateSession()
            session.transferUserInfo(["helloUser":"My user info was arrived"])
        }
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController: WCSessionDelegate {
    
    func session(session: WCSession, didReceiveApplicationContext applicationContext: [String : AnyObject]) {
        dispatch_async(dispatch_get_main_queue(), {
            if let names = applicationContext["dict"] as? String {
                self.receivedNameLabel.text = names
                
                
            }
        })
        
    }
    
}
