//
//  InterfaceController.swift
//  TouristComplicationChallenge WatchKit Extension
//
//  Created by Thiago-Bernardes on 4/6/16.
//  Copyright © 2016 TB. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBOutlet var table: WKInterfaceTable!
    
    var tasks : [TaskModel]! = (TaskModel.savedTasks != nil) ? TaskModel.savedTasks : [TaskModel]()
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        table.setNumberOfRows(tasks.count, withRowType: "TaskRow")
        for (index,currentTask) in tasks.enumerate() {
            let currentRow = table.rowControllerAtIndex(index) as! RowController
            currentRow.currentTask = currentTask
            
        }
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
