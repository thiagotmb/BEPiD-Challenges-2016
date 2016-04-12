//
//  Request.swift
//  WeatherForecasts
//
//  Created by Thiago-Bernardes on 4/8/16.
//  Copyright © 2016 TB. All rights reserved.
//

import WatchKit

class ForecastsModel: NSObject {
    
    
    static var forecastsData = ForecastsModel.getObjectsDictionary()
    
    
    static func getObjectsDictionary() ->  NSDictionary {
        
        if  let url = NSURL(string: "https://api.myjson.com/bins/38x4i"),
            let jsonData = NSData(contentsOfURL: url) {
            do {
                if let jsonDict = try NSJSONSerialization.JSONObjectWithData(jsonData, options: [.AllowFragments]) as? NSDictionary {
                    return jsonDict
                }
            } catch {
                print(error)
            }
        }
        
        return NSDictionary()
        
    }
    
    static func getArrayDictionary()->NSMutableArray{
        
        let dictionaryJSON = getObjectsDictionary()
        
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
    
    static func getForecastOf(date:NSDate)-> [String: NSObject] {
        
        let arrayDictAllWind = getArrayDictionary()
        print(arrayDictAllWind)
        let newArray = arrayDictAllWind.sort { (dict1:AnyObject, dict2:AnyObject) -> Bool in
            
            let dateWind1 = dict1.objectForKey("dateWind") as! NSDate
            let dateWind2 = dict2.objectForKey("dateWind") as! NSDate
            
            let isBigger = fabs(dateWind1.timeIntervalSinceDate(date)) >=  fabs(dateWind2.timeIntervalSinceDate(date))
            
            return !isBigger
        }
        
        let windSpeed = newArray.first as! NSDictionary
        
        return windSpeed as! [String : NSObject]
    }
    
    
    static func getForecastsBefore(date:NSDate)->NSArray {
        
        let arrayDictAllWind = getArrayDictionary()
        
        let newArray = arrayDictAllWind.filter { (dict1:AnyObject) -> Bool in
            let dateWind1 = dict1.objectForKey("dateWind") as! NSDate
            let isBigger = dateWind1.timeIntervalSinceDate(date) < 0
            
            return isBigger
        }
        
        return newArray
    }
    
    static func getForecastsAfter(date:NSDate)->NSArray {
        
        let arrayDictAllWind = getArrayDictionary()
        
        let newArray = arrayDictAllWind.filter { (dict1:AnyObject) -> Bool in
            let dateWind1 = dict1.objectForKey("dateWind") as! NSDate
            let isBigger = dateWind1.timeIntervalSinceDate(date) >= 0
            
            return isBigger
        }
        
        
        return newArray
    }
    
}

