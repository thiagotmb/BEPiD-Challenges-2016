//
//  NSDate+Extension.swift
//  TouristComplicationChallenge
//
//  Created by Thiago-Bernardes on 4/7/16.
//  Copyright © 2016 TB. All rights reserved.
//

import WatchKit

extension NSDate {
    
    func toString() -> String {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        let date = dateFormatter.stringFromDate(self)
        return date
        
    }
    
    
    func fromString(date: String) -> NSDate{
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        let date = dateFormatter.dateFromString(date)
        return date!
    }
    
}