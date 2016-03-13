//
//  InterfaceController.swift
//  Menu WatchKit Extension
//
//  Created by Thiago-Bernardes on 3/11/16.
//  Copyright © 2016 TB. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        self.addMenuItemWithItemIcon(WKMenuItemIcon.Add, title: "Add", action: "addNewSong")
        
        // Configure interface objects here.
    }
    
    
    @IBAction func saveFavoriteSong() {
        
        let yesAction = { () -> Void in
            
            print("saved")
            
        }
        
        let noAction = { () -> Void in
            print("not saved")
            
            
            
        }
        
        self.presentAlertControllerWithTitle("Loteria", message: "Quer ganhar um milhão?", preferredStyle: .Alert, actions: [
            
            WKAlertAction(title: "Não", style: .Default, handler: yesAction),
            WKAlertAction(title: "Não", style: .Default, handler: noAction)
            ])
    }
    
    func addNewSong(){
        
        print(__FUNCTION__)
        
        
    }
    
    @IBAction func newPlayAction() {
        
        print(__FUNCTION__)
        
    }
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
}
