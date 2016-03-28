//
//  InterfaceController.swift
//  ApplicationContextSample WatchKit Extension
//
//  Created by Thiago-Bernardes on 3/28/16.
//  Copyright © 2016 TB. All rights reserved.
//

import WatchKit
import Foundation
import WatchConnectivity

class InterfaceController: WKInterfaceController {

    var session : WCSession!
    @IBAction func yeltsinAction() {
        names("yeltsin")
    }
  
    @IBAction func carlosAction() {
        names("carlos")

    }
    
    @IBAction func weslleyAction() {
        names("weslley")

    }
    
    func names(name:String){
       dispatch_async(dispatch_get_main_queue(), {
        
        let dict = ["dict":name]
        do {
            
            try self.session.updateApplicationContext(dict)
            
        }catch {
            print(error)
        }

       })
        
        
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
         session = WCSession.defaultSession()
        session.delegate = self
        session.activateSession()
        
        super.willActivate()
    }



}

extension InterfaceController : WCSessionDelegate {
    
    
}