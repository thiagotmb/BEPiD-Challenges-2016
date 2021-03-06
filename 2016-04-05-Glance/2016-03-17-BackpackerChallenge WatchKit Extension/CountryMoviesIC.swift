//
//  CountryMoviesIC.swift
//  2016-03-17-BackpackerChallenge
//
//  Created by Thiago-Bernardes on 3/17/16.
//  Copyright © 2016 TB. All rights reserved.
//

import WatchKit
import Foundation


class CountryMoviesIC: WKInterfaceController {
    
    var currentCountry : Country!
   
    
    
    @IBAction func showMovie1() {
        pushControllerWithName("ShowMovieIC", context: currentCountry.name + "video1")
    }
    
    @IBAction func showMovie2() {
        pushControllerWithName("ShowMovieIC", context: currentCountry.name + "video2")
        
    }
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        currentCountry = context as! Country
        // Configure interface objects here.
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
