//
//  InterfaceController.swift
//  MessagesChallenge WatchKit Extension
//
//  Created by Thiago-Bernardes on 3/28/16.
//  Copyright © 2016 TB. All rights reserved.
//

import WatchKit
import Foundation
import WatchConnectivity

class InterfaceController: WKInterfaceController {

    @IBOutlet var table: WKInterfaceTable!
    var session: WCSession!

    var messages = MessageModel.savedMessages != nil ? MessageModel.savedMessages! : [MessageModel]()
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
    
        initWCSession()
        loadTable()
        // Configure interface objects here.
    }

    func loadTable() {
        table.setNumberOfRows(messages.count, withRowType: "MessageRow")
        
        for (index,message) in messages.enumerate() {
            
            
            let row = table.rowControllerAtIndex(index) as! MessageRowController
            row.message = message
            
        }
    }
    
    func addNewMessage(newMessage : MessageModel) {
        
        self.messages.append(newMessage)
        
        let indexSet = NSIndexSet(index: self.messages.count - 1)
        
        var rowType = "MessageRow"
        
        if newMessage.messageText == nil {
            rowType = "MessageRowImage"

        }
        
        self.table.insertRowsAtIndexes(indexSet, withRowType: rowType)
        let row = self.table.rowControllerAtIndex(self.messages.count - 1) as! MessageRowController
        row.message = newMessage

    }
    
    @IBAction func sendNewMessage() {
        
        presentTextInputControllerWithSuggestions(["Hi","Bye"], allowedInputMode: .AllowAnimatedEmoji) { (response:[AnyObject]?) -> Void in
            
            if let text = response?.first as? String{
               
                let message = MessageModel()
                message.messageText = text
                message.messageSender = .Watch
                self.addNewMessage(message)
                self.sendMessageToIphone(message)
                
            }
        }

        
    }

    override func didDeactivate() {
        super.didDeactivate()
        MessageModel.savedMessages = messages
    }
    

}



extension InterfaceController : WCSessionDelegate {
    
    func initWCSession() {
        
        if WCSession.isSupported() {
            
            session = WCSession.defaultSession()
            session.delegate = self
            session.activateSession()
        }
        
    }
    
    func sendMessageToIphone(message: MessageModel) {
        
        dispatch_async(dispatch_get_main_queue(), {
            let dict = ["message":message.compressForTransfer()]
            self.session.transferUserInfo(dict)

        })
        
        
    }
    
    func session(session: WCSession, didReceiveUserInfo userInfo: [String : AnyObject]) {
        
        dispatch_async(dispatch_get_main_queue(), {
            if let messageData = userInfo["message"] as? NSData {
                
                let newMessage = MessageModel()
                newMessage.decompressAndPopulateFromData(messageData)
                
                if let messageDataUrlString = userInfo["fileUrl"] as? String,
                    let url = NSURL(string: messageDataUrlString),
                    let data = NSData(contentsOfURL: url){
                    
                        newMessage.messageData = data

                }
                
                self.addNewMessage(newMessage)
                
            }
            
        })
        
    }
    


    
    
}
