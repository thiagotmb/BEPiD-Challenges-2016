//
//  RowController.swift
//  ChallengeBookStore
//
//  Created by Thiago-Bernardes on 3/11/16.
//  Copyright © 2016 TB. All rights reserved.
//

import WatchKit

class RowController: NSObject {
    
    @IBOutlet var bookNameLabel: WKInterfaceLabel!
    
    @IBOutlet var authorNameLabel: WKInterfaceLabel!
    
    @IBOutlet var priceLabel: WKInterfaceLabel!
    
    @IBOutlet var isBoughtImage: WKInterfaceImage!
    
    
    var bookName : String?
    var bookPrice : String?
    
    func loadRow(bookName: String, bookPrice:String){
        self.bookName = bookName
        self.bookPrice = bookPrice
        
        priceLabel.setText(bookPrice)
        bookNameLabel.setText(bookName)
    }
    
}
