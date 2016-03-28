//
//  InterfaceController.swift
//  MessageSample WatchKit Extension
//
//  Created by Thiago-Bernardes on 3/28/16.
//  Copyright © 2016 TB. All rights reserved.
//

import WatchKit
import Foundation
import WatchConnectivity

class InterfaceController: WKInterfaceController, WCSessionDelegate {

    @IBOutlet var labelCount: WKInterfaceLabel!
   
    var session: WCSession!
    
    var count = 0 {
        
        didSet {
            labelCount.setText("\(count)")
        }
    }
    
    @IBAction func incrementing() {
        
        count+=1
    }
    
    @IBAction func clear() {
        
        count = 0
    }
    
    
    @IBAction func transfer() {
        
         dispatch_async(dispatch_get_main_queue(), {
        let dict = ["count":self.count]
        self.session.sendMessage(dict, replyHandler: { (reply : [String : AnyObject]) in
            
            
        }) { (error: NSError) in
            
            
        }
        })
    }
    
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        
        if WCSession.isSupported() {
            session = WCSession.defaultSession()
            session.delegate = self
            session.activateSession()
        }
        
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
