//
//  Catchphrases.swift
//  Catchphrases
//
//  Created by Marcos Morais on 12/02/16.
//  Copyright © 2016 BEPiD UCB. All rights reserved.
//

import UIKit

class Catchphrases: NSObject {
    
    static let listOfPhrases = ["Cool, cool, cool.",
        "It’s a shame you can only die once.",
        "Just because you shot Jesse James, don’t make you Jesse James.",
        "How you doin?",
        "I Want To Believe",
        "It’s gonna be legen- wait for it -dary! LEGENDARY!",
        "Suit up!", "Property of Ted Mosby",
        "I like Turtles",
        "Get in the CHOPPER! NOW!!!",
        "Bazinga!",
        "Its the Winger Guarantee.",
        "Hasta la vista, baby.",
        "YEEEEEEAAAAH!",
        "Ms. Chanandler Bong.",
        "WE... are The Walking Dead.",
        "My name is Fox Mulder.",
        "Mulder, its me.",
        "Gotta catch em All.",
        "Bond. James Bond.",
        "A boys best friend is his mother.",
        "Do I look like I give a damn?",
        "ET phone home.",
        "I am Groot!",
        "I see dead people.",
        "Ill be back.",
        "Its not murder, its ketchup.",
        "Continue a nadar, continue a nadar...",
        "Você é um BRINQUEDO!",
        "Buzz Lightyear do Comando Estelar!",
        "Get back in here and make me a Sandwich!",
        "Awesome.",
        "Aaow!",
        "Youve been hit by, youve been struck by, a Smooth Criminal",
        "To infinity… and beyond.",
        "Huallyd.",
        "Eu sou o rei do mundo!",
        "Luke, eu sou o seu pai!",
        "Aqui está o Johnny!",
        "My precious...",
        "YOU SHALL NOT... PASS!",
        "This is SPARTA!",
        "Do you like Scary Movies?",
        "Pede pra sair!",
        "Show me the Money.",
        "Woot!",
        "Theres always money in the Banana Stand."]

}
extension Int {
    func random() -> Int {
        return Int(arc4random_uniform(UInt32(self)))
    }
}
