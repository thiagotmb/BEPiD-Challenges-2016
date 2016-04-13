//
//  InterfaceController.swift
//  Pedometer WatchKit Extension
//
//  Created by Thiago-Bernardes on 4/13/16.
//  Copyright © 2016 TB. All rights reserved.
//

import WatchKit
import Foundation
import CoreMotion

class InterfaceController: WKInterfaceController {

    @IBOutlet var lblSteps: WKInterfaceLabel!
    @IBOutlet var lblDistance: WKInterfaceLabel!
    @IBOutlet var lblPace: WKInterfaceLabel!
    @IBOutlet var lblInterval: WKInterfaceLabel!
    
    var resultBlock : ((data: CMPedometerData?, error : NSError?) -> Void)!
    
    @IBAction func showLast3Hours() {
        
        
        PedometerManager.loadPedometerDataFromInterval(3, resultBlock: resultBlock)
        self.lblInterval.setText("Last 3 Hours")

    }
    
    
    @IBAction func showLast12Hours() {
        PedometerManager.loadPedometerDataFromInterval(12, resultBlock: resultBlock)
        lblInterval.setText("Last 12 Hours")

    }
    
    
    @IBAction func showLast24Hours() {
        PedometerManager.loadPedometerDataFromInterval(24, resultBlock: resultBlock)
        lblInterval.setText("Last 24 Hours")

    }
    
    @IBAction func showLast3Days() {
        PedometerManager.loadPedometerDataFromInterval(24*3, resultBlock: resultBlock)
        lblInterval.setText("Last 3 Days")

    }
    
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        print("awake")
        resultBlock = { (data: CMPedometerData?, error: NSError?) -> Void in
            print("tono bloco")
            if let data = data {
                self.lblSteps.setText("\(data.numberOfSteps)")
                self.lblDistance.setText(String(format: "%.1f m", data.distance!.floatValue))
                self.lblPace.setText("\(data.currentPace)")
                
            }
        }
        
//        PedometerManager.loadPedometerDataFromInterval(3,resultBlock: resultBlock)
        

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


