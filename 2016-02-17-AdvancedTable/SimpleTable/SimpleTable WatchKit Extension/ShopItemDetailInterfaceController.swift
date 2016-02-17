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
    
    @IBOutlet var shopItemImageInterface: WKInterfaceImage!
    @IBOutlet var shopItemNameInterface: WKInterfaceLabel!
    @IBOutlet var shopItemGroupInterface: WKInterfaceLabel!
    
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        if let currentShopItem = context as? ShopItem{
            
            
            shopItemNameInterface.setText("Nome: "+currentShopItem.shopItemName)
            shopItemGroupInterface.setText("País: "+currentShopItem.shopItemGroup)
            
        }
        
        // Configure interface objects here.
    }
    
    
}
