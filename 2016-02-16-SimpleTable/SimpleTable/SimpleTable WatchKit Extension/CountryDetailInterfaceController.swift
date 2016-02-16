//
//  CountryDetailInterfaceController.swift
//  SimpleTable
//
//  Created by Thiago-Bernardes on 2/16/16.
//  Copyright © 2016 TMB. All rights reserved.
//

import WatchKit
import Foundation


class CountryDetailInterfaceController: WKInterfaceController {
    
    @IBOutlet var countryImageInterface: WKInterfaceImage!
    @IBOutlet var countryNameInterface: WKInterfaceLabel!
    @IBOutlet var countryCodeInterface: WKInterfaceLabel!
    @IBOutlet var countryLongitudeInterface: WKInterfaceLabel!
    @IBOutlet var countryLatitudeInterface: WKInterfaceLabel!
    @IBOutlet var countryPostalCodeInterface: WKInterfaceLabel!
    
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        if let currentCountry = context as? Country{
            
            
            countryNameInterface.setText("Nome: "+currentCountry.countryName)
            countryCodeInterface.setText("País: "+currentCountry.countryCode)
            countryLatitudeInterface.setText("Lat: "+currentCountry.countryLatitude)
            countryLongitudeInterface.setText("Lng: "+currentCountry.countryLongitude)
            countryPostalCodeInterface.setText("Postal: "+currentCountry.countryPostalCode)
            countryImageInterface.setImage(currentCountry.countryImage)
        }
        
        // Configure interface objects here.
    }
    
    
}
