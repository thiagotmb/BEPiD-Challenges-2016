//
//  CountryRowController.swift
//  SimpleTable
//
//  Created by Thiago-Bernardes on 2/16/16.
//  Copyright © 2016 TMB. All rights reserved.
//

import WatchKit

class CountryRowController: NSObject {
    @IBOutlet var countryImage: WKInterfaceImage!
    
    @IBOutlet var countryNameLabel: WKInterfaceLabel!
    
    @IBOutlet var countryCodeLabel: WKInterfaceLabel!
    
    
    func loadWithCountry(country : Country){
        
        self.countryImage.setImage(country.countryImage)
        self.countryNameLabel.setText(country.countryName)
        self.countryCodeLabel.setText(country.countryCode)
    }
    
}
