//
//  InterfaceController.swift
//  SimpleTable WatchKit Extension
//
//  Created by Thiago-Bernardes on 2/16/16.
//  Copyright © 2016 TMB. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController    {
    
    @IBOutlet var countriesTable: WKInterfaceTable!
    
    let countriesArray : Array<Country> = Country.getCountries()
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        loadCountriesTable()

        // Configure interface objects here.
    }
    
    func loadCountriesTable(){
        
        countriesTable.setNumberOfRows(countriesArray.count, withRowType: "countryRow")
        
        for (currentIndex, currentCountry) in countriesArray.enumerate(){
            
            if  let currentCountryRowController = (countriesTable.rowControllerAtIndex(currentIndex) as? CountryRowController) {
                
                currentCountryRowController.loadWithCountry(currentCountry)
            }
        }
        
        
        
    }
    
    override func contextForSegueWithIdentifier(segueIdentifier: String, inTable table: WKInterfaceTable, rowIndex: Int) -> AnyObject? {
        
        return countriesArray[rowIndex]
        
    }
    
    
    
    
}
