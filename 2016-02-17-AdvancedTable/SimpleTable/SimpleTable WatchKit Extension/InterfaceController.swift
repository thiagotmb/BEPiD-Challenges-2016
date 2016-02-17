//
//  InterfaceController.swift
//  SimpleTable WatchKit Extension
//
//  Created by Thiago-Bernardes on 2/16/16.
//  Copyright © 2016 TMB. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController    {
    
    @IBOutlet var shopItemsTable: WKInterfaceTable!
    
    let shopItemsArray : Dictionary<String, Array<String>> = ShopItemRequest.getShopItemsByGroups()
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        loadShopItemsTable()
        
        // Configure interface objects here.
    }
    
    func loadShopItemsTable(){
        
        shopItemsTable.setNumberOfRows(shopItemsArray.count, withRowType: "shopItemRow")
        
        for (currentIndex, currentShopItem) in shopItemsArray.enumerate(){
            
            if  let currentShopItemRowController = (shopItemsTable.rowControllerAtIndex(currentIndex) as? ShopItemRowController) {
                
                currentShopItemRowController.loadWithShopItem(currentShopItem)
            }
        }
        
        
        
    }
    
    override func contextForSegueWithIdentifier(segueIdentifier: String, inTable table: WKInterfaceTable, rowIndex: Int) -> AnyObject? {
        
        return shopItemsArray[rowIndex]
        
    }
    
    
    
    
}
