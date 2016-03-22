//
//  InterfaceController.swift
//  2016-03-22-HapticChallenge WatchKit Extension
//
//  Created by Thiago-Bernardes on 3/22/16.
//  Copyright © 2016 TB. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {
    
    @IBOutlet var hapticTypesTable: WKInterfaceTable!
    
    var hapticTypesArray = [
        (WKHapticType.Click,".Click"),
        (WKHapticType.DirectionDown,".DirectionDown"),
        (WKHapticType.DirectionUp,".DirectionUp"),
        (WKHapticType.Failure,".Failure"),
        (WKHapticType.Notification,".Notification"),
        (WKHapticType.Retry,".Retry"),
        (WKHapticType.Start,".Start"),
        (WKHapticType.Stop,".Stop"),
        (WKHapticType.Success,".Success")
    ]
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        hapticTypesTable.setNumberOfRows(hapticTypesArray.count, withRowType: "HapticCell")
        
        for (index,hapticType) in hapticTypesArray.enumerate() {
            
            let rowController = hapticTypesTable.rowControllerAtIndex(index) as! HapticRowController
            
            rowController.hapticType = hapticType
            
        }
        
        // Configure interface objects here.
    }
    
    override func table(table: WKInterfaceTable, didSelectRowAtIndex rowIndex: Int) {
        
        
        let rowController = hapticTypesTable.rowControllerAtIndex(rowIndex) as! HapticRowController
        
        WKInterfaceDevice.currentDevice().playHaptic(rowController.hapticType.0)
    }
    
}
