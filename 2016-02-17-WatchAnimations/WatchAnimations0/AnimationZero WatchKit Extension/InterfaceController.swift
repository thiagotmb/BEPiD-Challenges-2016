//
//  InterfaceController.swift
//  AnimationZero WatchKit Extension
//
//  Created by Thiago-Bernardes on 2/18/16.
//  Copyright © 2016 TMB. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {
    
    @IBOutlet var crazyAnimatedLabel: WKInterfaceLabel!
    
    @IBOutlet var groupToAnimate: WKInterfaceGroup!
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        
        self.crazyAnimatedLabel.setAlpha(0)
        
        
        animateWithDuration(0.5) { () -> Void in
            
            
            
            self.crazyAnimatedLabel.setAlpha(1)
            self.crazyAnimatedLabel.setText("Au revoir")
            
            self.groupToAnimate.setHeight(0)
            
        }
        
    }
    
    
    @IBAction func changeText() {
        
        animateWithDuration(0.5) { () -> Void in
            
            self.crazyAnimatedLabel.setText("Salut")
            
            self.groupToAnimate.setHeight(200)
            
            
        }
        
    }
    
    
}
