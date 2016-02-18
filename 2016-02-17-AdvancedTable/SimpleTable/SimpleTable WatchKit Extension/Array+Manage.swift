//
//  Array+Manage.swift
//  SimpleTable
//
//  Created by Thiago-Bernardes on 2/17/16.
//  Copyright © 2016 TMB. All rights reserved.
//

import Foundation

extension Array where Element: NSDictionary{
    
    
    func justObjectsWithDictKey(group : String) -> [ShopItem?]{
        
        let filteredArray = self.map{ (item : NSDictionary) -> ShopItem? in
            if let itesm = item[group] as? String{
                
                let currentItem = ShopItem(itemName: itesm, groupName: group)
                
                return currentItem
            }
            return nil
        }
        
        return filteredArray
        
    }
    
    
    
}
