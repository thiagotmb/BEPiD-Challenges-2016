//
//  CountryRowController.swift
//  2016-03-17-BackpackerChallenge
//
//  Created by Thiago-Bernardes on 3/17/16.
//  Copyright © 2016 TB. All rights reserved.
//

import WatchKit

class CountryRowController: NSObject {
    
    
    
    @IBOutlet var countryNameLabel: WKInterfaceLabel!
    
    var country: Country! {
        didSet {
            countryNameLabel.setText(country.name)
        }
        
    }
    
}
