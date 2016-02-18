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
    
    var shopItemsDict : Dictionary<String, Array<ShopItem?>>!
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        
        dispatch_async(dispatch_get_global_queue(
            DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)){
            // Lógica de carregar demais dados
            self.shopItemsDict = ShopItem.getShopItemsByGroups()
            
            dispatch_async(dispatch_get_main_queue(), {
                
                self.loadShopItemsTable()
                
                })
            
        }
        
        // Configure interface objects here.
    }
    
    
    func loadShopItemsTable(){
        
        
        for (group,currentGroupArray)  in shopItemsDict{
        
        loadSection(group, currentItemsArray: currentGroupArray)
        
        
        }
        
        
        
    }
    
    
    func loadSection(currentGroup: String, currentItemsArray : Array<ShopItem?>){
        
        let rows = shopItemsTable.numberOfRows
        let headerIndex = NSIndexSet(index: rows)
        shopItemsTable.insertRowsAtIndexes(headerIndex, withRowType: "ShopGroupSection")
        
        let setctionController = shopItemsTable.rowControllerAtIndex(rows) as! ShopGroupRowController
        setctionController.groupTitleLabel.setText(currentGroup)
        
        let rowsRange = NSRange(location: rows + 1, length: currentItemsArray.count)
        let itemsRows = NSIndexSet(indexesInRange: rowsRange)
        shopItemsTable.insertRowsAtIndexes(itemsRows, withRowType: "ShopItemRow")
        
        
        for (index,shopItem) in currentItemsArray.enumerate(){
            if let currentItem = shopItem as ShopItem?{
            
            let rowController = shopItemsTable.rowControllerAtIndex(index+rows+1) as! ShopItemRowController
            
            rowController.loadWithShopItem(currentItem)
            }
        }
        
        
        
    }
    
    override func contextForSegueWithIdentifier(segueIdentifier: String, inTable table: WKInterfaceTable, rowIndex: Int) -> AnyObject? {
            
            
            let currentRow = table.rowControllerAtIndex(rowIndex)  as? ShopItemRowController
            
            let currentItem = currentRow?.shopItem
            
            return currentItem
            
    }
    
    
}
