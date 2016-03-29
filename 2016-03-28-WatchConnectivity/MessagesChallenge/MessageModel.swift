//
//  MessageModel.swift
//  MessagesChallenge
//
//  Created by Thiago-Bernardes on 3/28/16.
//  Copyright © 2016 TB. All rights reserved.
//

import UIKit

enum MessageSender: String {
    case Iphone, Watch
    
}
class MessageModel: NSObject {
    
    var messageText: String!
    var messageData: NSData!
    var messageSender: MessageSender!
    
 
    func toDictionary() -> [String : AnyObject] {
        
        
        var objectDict : [String : AnyObject] = [String : AnyObject]()
        
        if messageText != nil {
            objectDict["messageText"] = messageText
        }
        
        objectDict["messageSender"] =  messageSender.rawValue

  
        
        return objectDict
    }
    
    func populateFromDict(dict: [String : AnyObject]) {
        
        
        if let messageText = dict["messageText"] as? String {
            self.messageText = messageText

        }

        let messageSenderString = dict["messageSender"] as! String
        var messageSender : MessageSender
        switch messageSenderString {
        case "Iphone":
            messageSender = .Iphone
        case "Watch":
            messageSender = .Watch
        default:
            messageSender = .Iphone
        }
        
        self.messageSender = messageSender
        

    }
    
    func compressForTransfer() -> NSData{
        
        let objectDict = self.toDictionary()
        
        let compressedData = NSKeyedArchiver.archivedDataWithRootObject(objectDict)
        
        return compressedData
        
    }
    
    
    func decompressAndPopulateFromData(compressedData: NSData){
        
        let descompressedDict = NSKeyedUnarchiver.unarchiveObjectWithData(compressedData) as! [String : AnyObject]
        self.populateFromDict(descompressedDict)
        
    }

    
}
