//
//  InterfaceController.swift
//  Hello Watch WatchKit Extension
//
//  Created by Thiago-Bernardes on 2/11/16.
//  Copyright © 2016 TMB. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {
    
    
    
    @IBOutlet var timer: WKInterfaceTimer!
    var timerIsRunning  = false
    let countdownInSeconds : NSTimeInterval = 5
    
    
    @IBOutlet var startButton: WKInterfaceButton!
    
    
    var lapCount = 0
    @IBOutlet var lapCountLabel: WKInterfaceLabel!
    @IBOutlet var lapLabelsGroup: WKInterfaceGroup!
    
    
    @IBAction func startTime() {
        
        if !timerIsRunning{
            
            self.startButton.setAlpha(0)
            self.startButton.setTitle("Add Lap")
            animateWithDuration(1, animations: {() -> Void in
            
                self.lapLabelsGroup.setAlpha(1)
                self.startButton.setAlpha(1)

            
            })
            timerIsRunning = true
            
            
            
            let timerCountdownDate = NSDate(timeIntervalSinceNow: countdownInSeconds)
            let timerFinishedAction = NSTimer(fireDate: timerCountdownDate, interval: 0, target: self, selector: "prepareNewTimer", userInfo: nil, repeats: false)
            
            timer.setDate(timerCountdownDate)
            timer.start()
            NSRunLoop.currentRunLoop().addTimer(timerFinishedAction, forMode: NSRunLoopCommonModes)
            
        }else{
            
            lapCount++
            self.lapLabelsGroup.setAlpha(0)
            self.lapCountLabel.setText("\(self.lapCount)")
            animateWithDuration(1, animations: {() -> Void in
                self.lapLabelsGroup.setAlpha(1)
            })
            
        }
    }
    
    func prepareNewTimer(){
        
        timerIsRunning = false
        lapCount = 0
        lapCountLabel.setText("\(lapCount)")
        
        startButton.setTitle("Start")
        startButton.setAlpha(0)
        animateWithDuration(1, animations: {() -> Void in
            
            self.lapLabelsGroup.setAlpha(0)
            self.startButton.setAlpha(1)

            
        })

     
        
        
    }
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        lapCount = 0
        
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
