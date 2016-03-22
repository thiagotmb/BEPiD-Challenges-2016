//
//  HapticRowController.swift
//  2016-03-22-HapticChallenge
//
//  Created by Thiago-Bernardes on 3/22/16.
//  Copyright © 2016 TB. All rights reserved.
//

import WatchKit

class HapticRowController: NSObject {
    
    @IBOutlet var hapticNameLabel: WKInterfaceLabel!
    
    
    var hapticType: (WKHapticType,String)! {
        
        didSet {
            
            self.hapticNameLabel.setText(hapticType.1)
            
        }
        
        
    }
    
    
    
    
}
