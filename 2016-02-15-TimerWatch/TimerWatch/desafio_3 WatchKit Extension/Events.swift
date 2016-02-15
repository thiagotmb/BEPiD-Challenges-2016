//
//  Events.swift
//  Aula02
//
//  Created by Pedro Neiva Alves on 2/15/16.
//  Copyright © 2016 Pedro Neiva Alves. All rights reserved.
//

import UIKit

class Events: NSObject {
    
    
    static let listOfEvents = [("Revisar matéria da última aula", "14:00"),
        ("Aprender WKInterfaceLabel", "14:30"),
        ("Aprender WKInterfaceButton", "15:00"),
        ("Aprender WKInterfaceGroup", "15:30"),
        ("Aprender WKInterfaceDate", "16:00"),
        ("Hora do lanche", "16:20"),
        ("Aprender WKInterfaceTimer", "16:30"),
        ("Formar 5 grupos", "17:00"),
        ("Deploy no Watch", "17:30"),
        ("Ir para casa", "18:00")]
    
}
extension Int {
    func random() -> Int {
        return Int(arc4random_uniform(UInt32(self)))
    }
}
