//
//  InterfaceController.swift
//  2016-03-17-BackpackerChallenge WatchKit Extension
//
//  Created by Thiago-Bernardes on 3/17/16.
//  Copyright © 2016 TB. All rights reserved.
//

import WatchKit
import Foundation


class CountryIC: WKInterfaceController {
    
    
    @IBOutlet var countryTable: WKInterfaceTable!
    
    var countries = Country.loadCountries()
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        loadCountryTable()
        
    }
    
    
    func loadCountryTable(){
        
        countryTable.setNumberOfRows(countries.count, withRowType: "CountryRowType")
        
        for (index,currentCountry) in countries.enumerate() {
            
            let currentRow = countryTable.rowControllerAtIndex(index) as! CountryRowController
            currentRow.country = currentCountry
            
        }
        
    }
    
    override func contextForSegueWithIdentifier(segueIdentifier: String, inTable table: WKInterfaceTable, rowIndex: Int) -> AnyObject? {
        
        let row = table.rowControllerAtIndex(rowIndex) as! CountryRowController
        
        return row.country
        
    }
    
    override func handleUserActivity(userInfo: [NSObject : AnyObject]?) {
        
        if let countryIndex = userInfo?["countryIndex"] as? Int {
            
            let selectedCountry = countries[countryIndex]
            pushControllerWithName("CountryDetail", context: selectedCountry)
            
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
