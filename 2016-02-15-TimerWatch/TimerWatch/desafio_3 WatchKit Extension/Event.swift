//
//  Event.swift
//  desafio_3
//
//  Created by Dennis Merli Rodrigues on 2/15/16.
//  Copyright © 2016 Dennis Merli Rodrigues. All rights reserved.
//

import Foundation
import RealmSwift

class Event: Object {
    dynamic var date : String = ""
    dynamic var title : String = ""
    dynamic var idEvent = 0
    
    convenience init(title: String, date: String) {
        self.init()
        self.title = title
        self.date = date
    }
    
    override func isEqual(object: AnyObject?) -> Bool {
        if let otherObject = object as? Event {
            if otherObject.date == self.date && otherObject.title == self.title{
                return true
            }
            
        }
        
        return false
        
    }
    
//    override static func primaryKey() -> String? {
//        return "idEvent"
//    }
    
}