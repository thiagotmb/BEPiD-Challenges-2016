//
//  GlanceInterfaceController.swift
//  2016-03-17-BackpackerChallenge
//
//  Created by Thiago-Bernardes on 4/5/16.
//  Copyright © 2016 TB. All rights reserved.
//

import WatchKit
import Foundation


class GlanceInterfaceController: WKInterfaceController {

    @IBOutlet var lblCountryTitle: WKInterfaceLabel!
    
    
    @IBOutlet var imgCountryFlag: WKInterfaceImage!
    
    @IBOutlet var lblCountryLocation: WKInterfaceLabel!
    
    
    
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        if let currentCountry = Country.loadCountries().first {
            
            lblCountryTitle.setText(currentCountry.name)
            setLocationLabel(currentCountry.location)
            imgCountryFlag.setImage(UIImage(named: currentCountry.name))
            updateUserActivity("TB.-016-03-17-BackpackerChallenge.glance",
                               userInfo: ["countryIndex": 0],
                               webpageURL: nil)

        }
        
        // Configure interface objects here.
    }

    func setLocationLabel(location: (Double,Double)){
        let twoDecimalsFormat = ".2"
        lblCountryLocation.setText("Lat:\(location.0.format(twoDecimalsFormat)) " + "Lng:\(location.1.format(twoDecimalsFormat))")
        
        
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

extension Double {
    func format(f: String) -> String {
        return String(format: "%\(f)f", self)
    }
}