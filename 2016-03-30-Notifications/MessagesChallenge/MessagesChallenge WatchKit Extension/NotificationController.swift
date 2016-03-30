//
//  NotificationController.swift
//  MessagesChallenge
//
//  Created by Thiago-Bernardes on 3/30/16.
//  Copyright © 2016 TB. All rights reserved.
//

import WatchKit
import Foundation


class NotificationController: WKUserNotificationInterfaceController {
    @IBOutlet var messagesSentAmount: WKInterfaceLabel!

    @IBOutlet var receivedAmount: WKInterfaceLabel!
    
    @IBOutlet var lastImageSent: WKInterfaceImage!
    
    override init() {
        // Initialize variables here.
        super.init()
        
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

    
    override func didReceiveLocalNotification(localNotification: UILocalNotification, withCompletion completionHandler: ((WKUserNotificationInterfaceType) -> Void)) {
        // This method is called when a local notification needs to be presented.
        // Implement it if you use a dynamic notification interface.
        // Populate your dynamic notification interface as quickly as possible.
        //
        // After populating your dynamic notification interface call the completion block.
        
        if let sentAmount = MessageModel.messagesSentByWatch?.count,
            let receivedAmount = MessageModel.messagesSentByIphone?.count {
            
            self.messagesSentAmount.setText("\(sentAmount)")
            self.receivedAmount.setText("\(receivedAmount)")
            
        }
        
        if let lastMessageData = MessageModel.lastImageSentByWatch?.messageData {
            
            self.lastImageSent.setImage(UIImage(data:lastMessageData ))
            
        }
        
        completionHandler(.Custom)
    }
    
    
    
    override func didReceiveRemoteNotification(remoteNotification: [NSObject : AnyObject], withCompletion completionHandler: ((WKUserNotificationInterfaceType) -> Void)) {
        // This method is called when a remote notification needs to be presented.
        // Implement it if you use a dynamic notification interface.
        // Populate your dynamic notification interface as quickly as possible.
        //
        // After populating your dynamic notification interface call the completion block.
        
        
        if let sentAmount = MessageModel.messagesSentByWatch?.count,
            let receivedAmount = MessageModel.messagesSentByIphone?.count {
            
            self.messagesSentAmount.setText("\(sentAmount)")
            self.receivedAmount.setText("\(receivedAmount)")
            
        }
        
        if let lastMessageData = MessageModel.lastImageSentByWatch!.messageData {
            
            self.lastImageSent.setImage(UIImage(data:lastMessageData ))

        }
        

        completionHandler(.Custom)
    }
    
}
