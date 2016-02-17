//: Playground - noun: a place where people can play

import UIKit
//
//var str = "Hello, playground"
//
//let shopItemURL = "https://api.myjson.com/bins/2nqw7";
//
//let jsonData = NSData(contentsOfURL: NSURL(string: shopItemURL)!)!
//
//let jsonResult: AnyObject
//
//do{
//    jsonResult = try (NSJSONSerialization.JSONObjectWithData(jsonData, options: []) as? NSArray)!
//    //            print("AsSynchronous\(jsonResult)")
//    
//    _stdlib_getDemangledTypeName(jsonResult).componentsSeparatedByString(".").last!
//}catch{
//    print(error)
//}
//
//
//


var array = [["beverage":"cerveja", "Fruit": "OK"],["Fruit" : "Apple"], ["Fruit":"Rice"]]


let fruitsArray = array.map { (item : [String : String]) -> String? in
    if let itesm = item["Fruit"]{
        return itesm
    }
    return nil
}

