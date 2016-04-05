//
//  InterfaceController.swift
//  WhiplashConnectivity WatchKit Extension
//
//  Created by Thiago-Bernardes on 4/5/16.
//  Copyright © 2016 TB. All rights reserved.
//

import WatchKit
import WatchConnectivity


class InterfaceController: WKInterfaceController, WCSessionDelegate {

    @IBOutlet var lashesCountLabel: WKInterfaceLabel!
    
    var lashesCount = 0 {
        didSet {
            lashesCountLabel.setText("\(lashesCount)")
        }
    }
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        
        
        var session: WCSession!
        if WCSession.isSupported() {
            session = WCSession.defaultSession()
            session.delegate = self
            session.activateSession()
        }
        super.willActivate()
    }
    
    func session(session: WCSession, didReceiveMessage message: [String : AnyObject]) {
        
        lashesCount += 1
        WKInterfaceDevice.currentDevice().playHaptic(.Notification)
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
