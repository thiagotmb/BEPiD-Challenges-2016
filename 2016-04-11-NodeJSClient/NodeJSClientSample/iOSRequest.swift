//
//  iOSRequest.swift
//  DeserializacaoJSON
//
//  Created by Luís Resende on 16/02/16.
//  Copyright © 2016 Luis Resende. All rights reserved.
//

import Foundation

internal let jsonURL  = "http://localhost:8000/meusBrother"

class iOSRequest: NSObject{
    
    static func parseJSON(data: NSData) -> NSArray{
        var jsonResult: NSArray = NSArray()
        do{
            jsonResult = try (NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions()) as? NSArray)!
        }catch{
            print(error)
        }
        
        return jsonResult
    }
    
    static func getJSON(urlToRequest: String) -> NSArray{
        let jsonData = NSData(contentsOfURL: NSURL(string: urlToRequest)!)!
        return parseJSON(jsonData)
    }
    
    static func getArrayDictionary()->NSMutableArray{
        
        let dictionaryJSON = getJSON(jsonURL)
        
        let arrayDicitionaryWinds = NSMutableArray()
        
        for (_,item) in dictionaryJSON.enumerate() {

            print(item)
                       
        }
        return arrayDicitionaryWinds
    }
}

