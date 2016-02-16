//
//  Country+Request.swift
//  SimpleTable
//
//  Created by Thiago-Bernardes on 2/16/16.
//  Copyright © 2016 TMB. All rights reserved.
//

import WatchKit

let countryURL = "https://api.myjson.com/bins/2jo7n";

extension Country{
    
    
    private class func parseJSON(data: NSData) -> NSDictionary{
        
        
        var jsonResult: NSDictionary = NSDictionary()
        
        do{
            jsonResult = try (NSJSONSerialization.JSONObjectWithData(data, options: []) as? NSDictionary)!
            //            print("AsSynchronous\(jsonResult)")
        }catch{
            print(error)
        }
        
        
        return jsonResult
    }
    
    private class func getJSON() -> NSDictionary{
        let jsonData = NSData(contentsOfURL: NSURL(string: countryURL)!)!
        return parseJSON(jsonData)
    }
    
    private class func getObjects() -> NSArray{
        
        let objects = getJSON()["postalcodes"] as? NSArray
        
        return objects!
        
    }
    
    class func getCountries() -> Array<Country>{
        
        
        let countriesDictArray = getObjects()
        
        var countriesObjectsArray : Array<Country>  = []
        
        for countryDict in countriesDictArray{
            
            
            let countryName = countryDict["placeName"] as! String
            let countryCode = countryDict["countryCode"] as! String
            let countryImage = UIImage(named: "\(arc4random_uniform(5 - 1) + 1)")
            let countryLatitude = (countryDict["lat"] as! NSNumber).stringValue
            let countryLongitude = (countryDict["lng"] as! NSNumber).stringValue
            let countryPostalCode = countryDict["postalcode"] as! String
            
            let countryObject = Country(countryName: countryName, countryCode: countryCode, countryImage: countryImage!, countryLatitude: countryLatitude, countryLongitude: countryLongitude, countryPostalCode: countryPostalCode)
            
            countriesObjectsArray.append(countryObject)
            
        }
        
        return countriesObjectsArray
        
    }
}
