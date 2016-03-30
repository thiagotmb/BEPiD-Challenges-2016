//
//  MessageRowController.swift
//  MessagesChallenge
//
//  Created by Thiago-Bernardes on 3/29/16.
//  Copyright © 2016 TB. All rights reserved.
//

import WatchKit

class MessageRowController: NSObject {
    
    
    @IBOutlet var messageLabel: WKInterfaceLabel!
    @IBOutlet var messageSenderImage: WKInterfaceImage!
    
    @IBOutlet var messageImage: WKInterfaceImage!
    
    var message: MessageModel! {
        
        didSet {  
            
            if message.messageText != nil {
                messageLabel.setText(message.messageText)
            } else {
                messageImage.setImage(UIImage(data: message.messageData))
            }
            
            
            if let senderImageName = message.messageSender?.rawValue {
                messageSenderImage.setImage(UIImage(named: senderImageName)!)
                
            }
            
        }
        
    }
    
    
}
