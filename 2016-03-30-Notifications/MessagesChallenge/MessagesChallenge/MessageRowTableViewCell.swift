//
//  MessageRowTableViewCell.swift
//  MessagesChallenge
//
//  Created by Thiago-Bernardes on 3/28/16.
//  Copyright © 2016 TB. All rights reserved.
//

import UIKit

class MessageRowTableViewCell: UITableViewCell {
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var messageSenderImage: UIImageView!
    
    @IBOutlet weak var messageImage: UIImageView!
    
    var message: MessageModel! {
        
        didSet {
            if message.messageText != nil {
                messageImage.removeConstraints(messageImage.constraints)
                messageLabel.text = message.messageText
                messageLabel.hidden = false
            } else {
                messageLabel.removeConstraints(messageLabel.constraints)
                messageImage.image = UIImage(data: message.messageData)
                messageImage.hidden = false

            }
            messageSenderImage.image = UIImage(named: message.messageSender.rawValue)!

        }
        
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
