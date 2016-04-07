//
//  RowController.swift
//  TouristComplicationChallenge
//
//  Created by Thiago-Bernardes on 4/7/16.
//  Copyright © 2016 TB. All rights reserved.
//

import WatchKit

class RowController: NSObject {

    @IBOutlet var lblTaskHour: WKInterfaceLabel!
    @IBOutlet var lblTaskName: WKInterfaceLabel!
    
    @IBOutlet var btnDone: WKInterfaceButton!
    
    
    var currentTask: TaskModel! {
        
        didSet {
            
            lblTaskHour.setText(currentTask.hour.toString())
            lblTaskName.setText(currentTask.name)
            currentTask.isDone! ? btnDone.setTitle("Done") : btnDone.setTitle("To Do")
        }
    }
    
    
    @IBAction func doneAction() {
        
        let isDone = Bool(1 - Int(currentTask.isDone))
        currentTask.isDone = isDone
        currentTask.isDone! ? btnDone.setTitle("Done") : btnDone.setTitle("To Do")
    }
}


