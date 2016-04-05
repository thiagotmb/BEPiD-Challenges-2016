//
//  ShowMovieIC.swift
//  2016-03-17-BackpackerChallenge
//
//  Created by Thiago-Bernardes on 3/18/16.
//  Copyright © 2016 TB. All rights reserved.
//

import WatchKit
import Foundation


class ShowMovieIC: WKInterfaceController {
    
    @IBOutlet var moviePlayer: WKInterfaceMovie!
    
    @IBOutlet var videoNameLabel: WKInterfaceLabel!
    
    var videoName : String! {
        
        didSet {
            
            videoNameLabel.setText(videoName)
        }
    }
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        videoName = context as! String
        
        let urlLocal = NSBundle.mainBundle().URLForResource(videoName, withExtension: "3gp")
        
        moviePlayer.setMovieURL(urlLocal!)
        
        // Configure interface objects here.
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
