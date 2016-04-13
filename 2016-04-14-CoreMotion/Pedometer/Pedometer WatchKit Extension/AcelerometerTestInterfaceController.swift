//
//  AcelerometerTestInterfaceController.swift
//  Pedometer
//
//  Created by Thiago-Bernardes on 4/13/16.
//  Copyright © 2016 TB. All rights reserved.
//

import WatchKit
import Foundation
import CoreMotion

class AcelerometerTestInterfaceController: WKInterfaceController {

    
    @IBOutlet var lblX: WKInterfaceLabel!
    @IBOutlet var lblY: WKInterfaceLabel!
    @IBOutlet var lblZ: WKInterfaceLabel!
    
    let motionManager = CMMotionManager()

    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        startAcelerometer()
        // Configure interface objects here.
    }

    func startAcelerometer() {
        
        if motionManager.accelerometerAvailable {
            
            motionManager.accelerometerUpdateInterval = 0.5
            
            motionManager.startAccelerometerUpdatesToQueue(NSOperationQueue.mainQueue(), withHandler: {(data, error) in
                
                self.lblX.setText("\(data!.acceleration.x)")
                self.lblY.setText("\(data!.acceleration.y)")
                self.lblZ.setText("\(data!.acceleration.z)")

                
            })
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
