//
//  ShopItem+Request.swift
//  SimpleTable
//
//  Created by Thiago-Bernardes on 2/16/16.
//  Copyright © 2016 TMB. All rights reserved.
//

import WatchKit

let shopItemURL = "https://api.myjson.com/bins/2nqw7";
extension ShopItem{
    
    
    private class func parseJSON(data: NSData) -> NSArray{
        
        
        var jsonResult: NSArray = NSArray()
        
        do{
            jsonResult = try (NSJSONSerialization.JSONObjectWithData(data, options: []) as! NSArray)
            
        }catch{
            print(error)
        }
        
        return jsonResult
    }
    
    private class func getJSON() -> NSArray{
        let jsonData = NSData(contentsOfURL: NSURL(string: shopItemURL)!)!
        return parseJSON(jsonData)
    }
    
    
    class func getShopItemsByGroups() -> Dictionary<String, Array<ShopItem?>>{
        
        
        var shopItemsParsedArray =  Dictionary<String, Array<ShopItem?>>()
        
        if let shopItemsDictArray = getJSON() as? [NSDictionary]{
            
            if let groupTypes = shopItemsDictArray.first?.allKeys as? [String]{
                
                for groupType in groupTypes{
                    
                    
                    if let currentGroupArray = shopItemsDictArray.justObjectsWithDictKey(groupType) as? [ShopItem?]{
                        
                        shopItemsParsedArray[groupType] = currentGroupArray
                        
                    }
                    
                }
            }
            
        }
        
        return shopItemsParsedArray
        
    }
    
    
    
}
