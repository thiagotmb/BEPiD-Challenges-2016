//
//  MessageModel.swift
//  MessagesChallenge
//
//  Created by Thiago-Bernardes on 3/28/16.
//  Copyright © 2016 TB. All rights reserved.
//

import UIKit

enum MessageSender {
    case Iphone, Watch
    
}
class MessageModel: NSObject {

    var messageText: String!
    var messageData: NSData!
    var iphoneSend: MessageSender!
    
    
}
