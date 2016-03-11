//
//  InterfaceController.swift
//  Animation1 WatchKit Extension
//
//  Created by Thiago-Bernardes on 2/19/16.
//  Copyright © 2016 TMB. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {
    
    @IBOutlet var iGroup: WKInterfaceGroup!
    @IBOutlet var rodaImage: WKInterfaceImage!
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        
        rodaImage.setImageNamed("roda-")
        self.rodaImage.startAnimatingWithImagesInRange(NSRange(location: 0,length: 5), duration: 0, repeatCount: 1)
        
        animateWithDuration(1) { () -> Void in
            self.iGroup.setHeight(0)
            self.rodaImage.startAnimating()
            
        }
        
        
        //        performSelector("bye", withObject: nil, afterDelay: 5)
        
        let delayTime = dispatch_time(DISPATCH_TIME_NOW, Int64(600 * Double(NSEC_PER_MSEC)))
        
        dispatch_after(delayTime, dispatch_get_main_queue()){ () -> Void in
            
            self.bye()
            
        }
        
        // Configure interface objects here.
    }
    
    func bye(){
        animateWithDuration(3) { () -> Void in
            self.rodaImage.stopAnimating()
            self.iGroup.setHeight(200)
            
        }
        
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
