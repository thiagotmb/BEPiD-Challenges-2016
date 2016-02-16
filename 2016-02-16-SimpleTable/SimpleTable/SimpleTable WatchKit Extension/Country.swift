//
//  Country.swift
//  SimpleTable
//
//  Created by Thiago-Bernardes on 2/16/16.
//  Copyright © 2016 TMB. All rights reserved.
//

import WatchKit

class Country: NSObject {
    
    var countryName : String!
    var countryCode : String!
    var countryImage : UIImage!
    var countryLatitude : String!
    var countryLongitude : String!
    var countryPostalCode : String!
    
    
    init(countryName : String, countryCode : String, countryImage : UIImage, countryLatitude : String, countryLongitude : String, countryPostalCode : String) {
        super.init()
        self.countryName = countryName
        self.countryCode = countryCode
        self.countryImage = countryImage
        self.countryLatitude = countryLatitude
        self.countryLongitude = countryLongitude
        self.countryPostalCode = countryPostalCode
    }
    
    
}
