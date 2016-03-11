//
//  InterfaceController.swift
//  PickerExample WatchKit Extension
//
//  Created by Thiago-Bernardes on 3/10/16.
//  Copyright © 2016 TB. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {
    
    @IBOutlet var fruitsPicker: WKInterfacePicker!
    
    let fruitsArray = [
        ("Apple", "I love cupertino", "Apple-icon-128"),
        ("Banana","Yes we have", "Banana-icon-128"),
        ("Cherry","Essa é a cereja","Cherry-icon-128"),
        ("Kiwi","Precisa de um barbeador","Kiwi-icon-128"),
        ("Strawberry","Strawberry fields forever","Strawberry-icon-128"),
        ("Citron","J'aime","Lemon-icon-128"),
    ]
    
    @IBOutlet var rangePicker: WKInterfacePicker!
    
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        setupRangePicker()
        
        // Configure interface objects here.
    }
    @IBAction func rangePickerChange(value: Int) {
        
        print(__FUNCTION__,"Selected \(value)")
    }
    
    func setupRangePicker() {
        
        let pickerItems : [WKPickerItem] = (1...100).map {
            
            let rangeImage = WKImage(imageName: "single\($0)suffix")
            let pickerItem = WKPickerItem()
            pickerItem.contentImage = rangeImage
            
            return pickerItem
            
        }
        
        rangePicker.setItems(pickerItems)
        
        
        
    }
    
    func setupFruitsPicker(){
        
        let pickerItems : [WKPickerItem] = fruitsArray.map { (fruitName, fruitDescription, fruitImageName) -> WKPickerItem in
            
            let pickerItem = WKPickerItem()
            
            pickerItem.title = fruitName
            pickerItem.caption = fruitDescription
            
            pickerItem.contentImage = WKImage(imageName: fruitImageName)
            
            
            return pickerItem
        }
        
        fruitsPicker.setItems(pickerItems)
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
