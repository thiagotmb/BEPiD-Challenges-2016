//
//  InterfaceController.swift
//  UserInfoSample WatchKit Extension
//
//  Created by Thiago-Bernardes on 3/28/16.
//  Copyright © 2016 TB. All rights reserved.
//

import WatchKit
import Foundation

import WatchConnectivity

class InterfaceController: WKInterfaceController {
    
    @IBOutlet var userInfoLabel: WKInterfaceLabel!
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        let session = WCSession.defaultSession()
        session.delegate = self
        session.activateSession()
        // Configure interface objects here.
    }
    
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    @IBOutlet var imageReceived: WKInterfaceImage!
    
}

extension InterfaceController : WCSessionDelegate {
    
    func session(session: WCSession, didReceiveUserInfo userInfo: [String : AnyObject]) {
        
        if let text = userInfo["helloUser"] as? String {
            self.userInfoLabel.setText(text)
            
        }
        
    }
    
    func session(session: WCSession, didReceiveFile file: WCSessionFile) {
        print(file.fileURL)
        print(file.metadata)
        
        
        if let data = NSData(contentsOfURL: file.fileURL),
            let image = UIImage(data: data) {
            imageReceived.setImage(image)
            
        }
        
    }
    
    
}

