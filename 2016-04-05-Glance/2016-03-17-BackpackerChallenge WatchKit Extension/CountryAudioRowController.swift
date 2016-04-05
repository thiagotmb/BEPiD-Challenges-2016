//
//  CountryAudioRowController.swift
//  2016-03-17-BackpackerChallenge
//
//  Created by Thiago-Bernardes on 3/18/16.
//  Copyright © 2016 TB. All rights reserved.
//

import WatchKit

class CountryAudioRowController: NSObject {
    
    @IBOutlet var audioNameLabel: WKInterfaceLabel!
    
    var audioName : String! {
        
        didSet {
            
            audioNameLabel.setText(audioName)
        }
    }
    
}
