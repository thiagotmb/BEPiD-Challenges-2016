//
//  InterfaceController.swift
//  2016-03-22-HapticChallenge WatchKit Extension
//
//  Created by Thiago-Bernardes on 3/22/16.
//  Copyright © 2016 TB. All rights reserved.
//

import WatchKit
import Foundation

let hapticUrlReference = "https://developer.apple.com/library/watchos/documentation/WatchKit/Reference/WKInterfaceDevice_class/#//apple_ref/c/econst/"

class InterfaceController: WKInterfaceController {
    
    @IBOutlet var hapticTypesTable: WKInterfaceTable!
    
    
    
    var hapticTypesArray = [
        (WKHapticType.Click,".Click","Indicates a simple click type of feedback. Use this haptic to mark fixed points along a path. Space out the intervals at which you play the haptic rather than playing it several times in quick succession."),
        (WKHapticType.DirectionDown,".DirectionDown", "Indicates a decrease in a specific value or when a value has gone below a certain threshold. For example, you could use this feedback when adjusting the value of a thermostat."),
        (WKHapticType.DirectionUp,".DirectionUp", "Indicates an increase in a specific value or when a value has gone above a certain threshold. For example, you could use this feedback when adjusting the value of a thermostat."),
        (WKHapticType.Failure,".Failure", "Indicates the failed completion of a task or answering of a question."),
        (WKHapticType.Notification,".Notification", "Alerts the user to an arrived notification when the Watch app is not running in the foreground."),
        (WKHapticType.Retry,".Retry", "Indicates that the user should retry a task that temporarily failed."),
        (WKHapticType.Start,".Start", "Indicates the beginning of an action. For example, a stopwatch app uses this haptic when the user starts the stopwatch."),
        (WKHapticType.Stop,".Stop", "Indicates the end of an action. For example, a stopwatch app uses this haptic when the user stops the stopwatch."),
        (WKHapticType.Success,".Success", "Indicates the successful completion of a task or the answering of a question.")
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
        pushControllerWithName("HapticDetail", context: rowController.hapticType.2)
    }
    
    override func willActivate() {
        
        updateUserActivity(Handoff.ActivityType.HapticsTable.rawValue,
            userInfo: [
                Handoff.version.key : Handoff.version.number
            ],
            webpageURL: nil)
        super.willActivate()
    }
    
}
