//
//  CatchyPhrasesDAO.swift
//  helloWatch_desafio2
//
//  Created by Dennis Merli Rodrigues on 2/12/16.
//  Copyright © 2016 Dennis Merli Rodrigues. All rights reserved.
//

import UIKit
import RealmSwift

class CatchyPhrasesDAO: NSObject {
    
    static let sharedInstance = CatchyPhrasesDAO()
    
    func incrementEventId() -> Int{
        let realm = try! Realm()
        let RetNext:NSArray = Array(realm.objects(Event)) as NSArray
        let last = RetNext.lastObject
        if RetNext.count > 0{
            let value = last?.valueForKey("idEvent") as? Int
            return value! + 1
        }else{
            return 0
        }
    }

    
    //MARK: Inserir frase
    
    func insertPhrase(event: Event, completion: (status : Bool) -> Void){
        let realm = try! Realm()
        //Inserir valor para o ID
//        event.idEvent = self.incrementEventId()
        try! realm.write {
            realm.add(event)
            //print(realm.path)
            completion(status: true)
        }
        
    }

    
    //MARK: Pegar todas as frases
    func getPhrasesArray() -> Results<(Event)>{
        let realm = try! Realm()
        return realm.objects(Event)
    }
}
