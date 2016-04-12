//
//  iOSRequest.swift
//  DeserializacaoJSON
//
//  Created by Luís Resende on 16/02/16.
//  Copyright © 2016 Luis Resende. All rights reserved.
//

import Foundation

internal let jsonURL  = "https://api.myjson.com/bins/38x4i"

class iOSRequest: NSObject{
    
    static func parseJSON(data: NSData) -> NSDictionary{
        var jsonResult: NSDictionary = NSDictionary()
        do{
            jsonResult = try (NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions()) as? NSDictionary)!
        }catch{
            print(error)
        }
        
        return jsonResult
    }
    
    static func getJSON(urlToRequest: String) -> NSDictionary{
        let jsonData = NSData(contentsOfURL: NSURL(string: urlToRequest)!)!
        return parseJSON(jsonData)
    }
    
    static func getArrayDictionary()->NSMutableArray{
        
        let dictionaryJSON = getJSON(jsonURL)
        
        let arrayDicitionaryWinds = NSMutableArray()
        
        for (_,item) in dictionaryJSON.enumerate() {

            let query = item.value as! NSDictionary
            
            let dateFormat = NSDateFormatter()
            dateFormat.dateFormat = "dd/MM/yyyy HH:mm:ss"
            dateFormat.timeZone = NSTimeZone.defaultTimeZone()
            
            let calendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)
            
            var dateWind = dateFormat.dateFromString(query.objectForKey("created") as! String)
            
            let calendarWind = calendar!.components([.Hour, .Minute, .Second], fromDate: dateWind!)
            
            dateWind = (calendar?.dateBySettingHour(calendarWind.hour, minute: calendarWind.minute, second: calendarWind.second, ofDate: NSDate(), options:.MatchFirst))!
            
            
            let results = query.valueForKey("results") as! NSDictionary
            let channel = results.valueForKey("channel") as! NSDictionary
            let windDict = channel.valueForKey("wind") as! NSDictionary
            let velocity = windDict.objectForKey("speed") as! String

            let dictionaryWind = NSMutableDictionary()
            dictionaryWind.setObject(velocity, forKey: "velocity")
            dictionaryWind.setObject(dateWind!, forKey: "dateWind")
            
            arrayDicitionaryWinds.addObject(dictionaryWind)
            
        }
        print(arrayDicitionaryWinds)
        return arrayDicitionaryWinds
    }
}

