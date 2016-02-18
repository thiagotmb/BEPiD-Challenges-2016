//
//  ShopItemDetailInterfaceController.swift
//  SimpleTable
//
//  Created by Thiago-Bernardes on 2/16/16.
//  Copyright © 2016 TMB. All rights reserved.
//

import WatchKit
import Foundation


class ShopItemDetailInterfaceController: WKInterfaceController {
    
    
    @IBOutlet var shopItemImage: WKInterfaceImage!
    @IBOutlet var shopItemTitle: WKInterfaceLabel!
    
    @IBOutlet var shopGroupImage: WKInterfaceImage!
    @IBOutlet var shopGroupTitle: WKInterfaceLabel!
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        //        
        if let currentShopItem = context as? ShopItem{
            
            shopItemTitle.setText(currentShopItem.itemName)
            shopGroupTitle.setText(currentShopItem.groupName)
            
            
        }
        
        // Configure interface objects here.
    }
    
    
}
