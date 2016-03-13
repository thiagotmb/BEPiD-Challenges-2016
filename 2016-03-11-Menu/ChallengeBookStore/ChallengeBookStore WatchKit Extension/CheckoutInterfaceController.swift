//
//  CheckoutInterfaceController.swift
//  ChallengeBookStore
//
//  Created by Thiago-Bernardes on 3/11/16.
//  Copyright © 2016 TB. All rights reserved.
//

import WatchKit
import Foundation


class CheckoutInterfaceController: WKInterfaceController {
    
    @IBOutlet var table: WKInterfaceTable!
    
    var boughtBooks = ((NSUserDefaults.standardUserDefaults().arrayForKey("boughtBooks") as? [Int]) != nil) ? NSUserDefaults.standardUserDefaults().arrayForKey("boughtBooks") as! [Int] : [Int]()
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        configureTable()
        
        // Configure interface objects here.
    }
    
    
    //Configure table attributtes
    private func configureTable() {
        
        table.setNumberOfRows(Books.books.count, withRowType: "BookRow")
        
        for (index, value) in Books.books.enumerate() {
            
            let rowController = table.rowControllerAtIndex(index) as? RowController
            
            rowController?.loadRow(value.1, bookPrice: value.2)
            rowController?.authorNameLabel.setText(value.0)
            
            if boughtBooks.contains(index) {
                
                rowController?.isBoughtImage.setAlpha(1)
            }
            
        }
    }
    
    
    override func table(table: WKInterfaceTable, didSelectRowAtIndex rowIndex: Int) {
        
        let rowController = table.rowControllerAtIndex(rowIndex) as! RowController
        
        let alertTitle = String(format: rowController.bookName! + ": " + rowController.bookPrice!)
        
        let confirmAction = WKAlertAction(title: "Yes", style: WKAlertActionStyle.Default) { () -> Void in
            
            self.boughtBooks.append(rowIndex)
            NSUserDefaults.standardUserDefaults().setObject(self.boughtBooks, forKey: "boughtBooks")
            self.configureTable()
        }
        
        let cancelAction = WKAlertAction(title: "No", style: WKAlertActionStyle.Cancel) { () -> Void in
            
        }
        
        presentAlertControllerWithTitle(alertTitle, message:"Confirm purchase ?" , preferredStyle: WKAlertControllerStyle.Alert, actions: [confirmAction,cancelAction])
        
    }
    
    @IBAction func comprarTudo() {
        for (index, _) in Books.books.enumerate() {
            
            self.boughtBooks.append(index)
            
        }
        NSUserDefaults.standardUserDefaults().setObject(boughtBooks, forKey: "boughtBooks")
        
        self.configureTable()
        
    }
    
    
}
