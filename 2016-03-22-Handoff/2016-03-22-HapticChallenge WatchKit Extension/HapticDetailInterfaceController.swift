//
//  HapticDetailInterfaceController.swift
//  2016-03-22-HapticChallenge
//
//  Created by Thiago-Bernardes on 3/22/16.
//  Copyright © 2016 TB. All rights reserved.
//

import WatchKit
import Foundation


class HapticDetailInterfaceController: WKInterfaceController {
    
    @IBOutlet var hapticLabel: WKInterfaceLabel!
    
    var  hapticExplanation = ""
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        hapticExplanation = context as! String
        
        hapticLabel.setText( hapticExplanation)
        
        
        // Configure interface objects here.
    }
    
    override func willActivate() {
        updateUserActivity(Handoff.ActivityType.HapticDetail.rawValue,
            userInfo: [
                Handoff.version.key : Handoff.version.number,
                Handoff.ActivityValueKey:  hapticExplanation
            ],
            webpageURL: nil)
        
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    
}
