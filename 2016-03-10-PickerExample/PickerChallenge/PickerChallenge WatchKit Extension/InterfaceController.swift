//
//  InterfaceController.swift
//  PickerChallenge WatchKit Extension
//
//  Created by Thiago-Bernardes on 3/10/16.
//  Copyright © 2016 TB. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        let fifty =  WKPickerItem()
        fifty.title = "50"
        
        let thirty =  WKPickerItem()
        thirty.title = "30"
        let pickerItems = [fifty, thirty]
        caloriePicker.setItems(pickerItems)
        caloriePicker.setEnabled(false)
        
        // Configure interface objects here.
    }
    
    @IBOutlet var caloriePicker: WKInterfacePicker!
    
    
    @IBAction func setMale() {
        caloriePicker.setSelectedItemIndex(0)
        
    }
    
    
    @IBAction func setFemale() {
        caloriePicker.setSelectedItemIndex(1)
    }
    
    @IBAction func pickerChanged(value: Int) {
        
        
        
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
