//
//  AverageStepsInterfaceController.swift
//  Pedometer
//
//  Created by Thiago-Bernardes on 4/13/16.
//  Copyright © 2016 TB. All rights reserved.
//

import WatchKit
import Foundation
import CoreMotion

class AverageStepsInterfaceController: WKInterfaceController {

    @IBOutlet var lblAverageSteps: WKInterfaceLabel!
    var resultBlock : ((data: CMPedometerData?, error : NSError?) -> Void)!

    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        loadAverageStapsForLast3Days()
        // Configure interface objects here.
    }

    func loadAverageStapsForLast3Days() {
        
        resultBlock = { (data: CMPedometerData?, error: NSError?) -> Void in
            if let data = data {
                self.lblAverageSteps.setText("\(data.numberOfSteps.floatValue/3)")
            }
        }
        
        PedometerManager.loadPedometerDataFromInterval(24*3,resultBlock: resultBlock)

        
        
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
