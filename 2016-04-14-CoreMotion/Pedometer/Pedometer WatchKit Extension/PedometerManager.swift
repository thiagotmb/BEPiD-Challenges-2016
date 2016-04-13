//
//  PedometerManager.swift
//  Pedometer
//
//  Created by Thiago-Bernardes on 4/13/16.
//  Copyright © 2016 TB. All rights reserved.
//

import WatchKit
import CoreMotion


class PedometerManager: NSObject {
    
    static let pedometer = CMPedometer()
    
    static func loadPedometerDataFromInterval(hourInterval: Int, resultBlock: (data: CMPedometerData?, error : NSError?) -> Void) {
        
        let endDate = NSDate()
        let calendar = NSCalendar.currentCalendar()
        print(endDate)
        let startDate = calendar.dateByAddingUnit(.Hour, value: -hourInterval, toDate: endDate, options: [])
        pedometer.queryPedometerDataFromDate(startDate!, toDate: endDate, withHandler: {(data, error) in
            print("foi")
            resultBlock(data: data,error: error)
        })
        
    }
    
    
}
