//
//  InterfaceController.swift
//  2016-23-03-Dictation WatchKit Extension
//
//  Created by Thiago-Bernardes on 3/23/16.
//  Copyright © 2016 TB. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {
    
    @IBOutlet var lblResultado: WKInterfaceLabel!
    
    @IBOutlet var imgEmoji: WKInterfaceImage!
    
    
    @IBAction func speak() {
        
        presentTextInputControllerWithSuggestions(["Hi","Bye"], allowedInputMode: .AllowAnimatedEmoji) { (response:[AnyObject]?) -> Void in
            
            if let text = response?.first as? String{
                self.lblResultado.setText(text)
                
                self.lblResultado.setHidden(false)
                self.imgEmoji.setHidden(true)
                
            }else if let animatedEmojiData = response?.first as? NSData {
                
                self.imgEmoji.setImageData(animatedEmojiData)
                
                self.lblResultado.setHidden(true)
                self.imgEmoji.setHidden(false)
                
            }
        }
        
    }
    
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        self.lblResultado.setHidden(true)
        self.imgEmoji.setHidden(true)
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
    
}
