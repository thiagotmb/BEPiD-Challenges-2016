//
//  Catchphrase.swift
//  WatchBordoes
//
//  Created by Thiago-Bernardes on 2/12/16.
//  Copyright © 2016 TMB. All rights reserved.
//

import Foundation
import CoreData


class Catchphrase: NSManagedObject {
    
    // Insert code here to add functionality to your managed object subclass
    class func saveCatchphrase(catchphraseString: String){
        let entityCatchphrase: NSEntityDescription = NSEntityDescription.entityForName("Catchphrase", inManagedObjectContext: CoredataContext.managedObjectContext)!
        let newCatchphrase : Catchphrase = Catchphrase(entity: entityCatchphrase, insertIntoManagedObjectContext: CoredataContext.managedObjectContext)
        newCatchphrase.content = catchphraseString
        
        CoredataContext.saveContext()
    }
    
    class func savedCatchphrases() -> [String] {
        let managedObjectContext: NSManagedObjectContext = CoredataContext.managedObjectContext
        
        let request: NSFetchRequest = NSFetchRequest(entityName: "Catchphrase")
        let requestResult: [Catchphrase]
        var catchphrases: [String] = []
        
        do {
            requestResult = try managedObjectContext.executeFetchRequest(request) as! [Catchphrase]
            if requestResult.count != 0 {
                
                for currentCatchphrase : Catchphrase in requestResult{
                    catchphrases.append(currentCatchphrase.content!)
                }
            }
            
        }catch let error as NSError{
            requestResult = []
            NSLog("Could not fetch phrases, Error: , Erro UserInfo: ", error, error.userInfo)
            
        }
        
        return catchphrases
    }
    
    
}

