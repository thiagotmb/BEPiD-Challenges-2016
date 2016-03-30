//
//  InterfaceController.swift
//  NotificationSample WatchKit Extension
//
//  Created by Thiago-Bernardes on 3/30/16.
//  Copyright © 2016 TB. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBOutlet var customLabel: WKInterfaceLabel!
    
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
    }

    override func handleActionWithIdentifier(identifier: String?, forRemoteNotification remoteNotification: [NSObject : AnyObject]) {
        
        if identifier == "secondBottom" {
            
            self.customLabel.setText("ITS OK")
        }
        
    }
}
