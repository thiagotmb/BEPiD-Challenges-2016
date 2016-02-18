//
//  ShopItem.swift
//  SimpleTable
//
//  Created by Thiago-Bernardes on 2/18/16.
//  Copyright © 2016 TMB. All rights reserved.
//

import WatchKit

class ShopItem: NSObject{
    
    var itemName : String!
    var itemImage : UIImage!
    var groupName : String?
    var groupImage : UIImage?
    
    
    init(itemName : String, groupName : String) {
        super.init()
        
        self.itemName = itemName
        self.groupName = groupName
        
    }
    
}