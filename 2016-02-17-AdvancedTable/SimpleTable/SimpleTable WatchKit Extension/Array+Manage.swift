//
//  Array+Manage.swift
//  SimpleTable
//
//  Created by Thiago-Bernardes on 2/17/16.
//  Copyright © 2016 TMB. All rights reserved.
//

import Foundation

extension Array where Element: NSDictionary{
    
    
    func justObjectsWithDictKey(key : String) -> [String?]{
        
        let filteredArray = self.map{ (item : NSDictionary) -> String? in
            if let itesm = item[key] as? String{
                return itesm
            }
            return nil
        }
        
        return filteredArray
        
    }
    
    
}
