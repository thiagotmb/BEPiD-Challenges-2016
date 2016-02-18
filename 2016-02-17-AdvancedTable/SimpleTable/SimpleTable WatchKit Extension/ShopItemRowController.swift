//
//  ShopItemRowController.swift
//  SimpleTable
//
//  Created by Thiago-Bernardes on 2/16/16.
//  Copyright © 2016 TMB. All rights reserved.
//

import WatchKit

class ShopItemRowController: NSObject {
    @IBOutlet var shopItemImage: WKInterfaceImage!
    
    @IBOutlet var shopItemNameLabel: WKInterfaceLabel!
    
    var shopItem : ShopItem!
    //    
    //    
    func loadWithShopItem(shopItem : ShopItem){
        
        self.shopItem = shopItem
        self.shopItemNameLabel.setText(shopItem.itemName)
    }
    
}
