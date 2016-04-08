//
//  ComplicationController.swift
//  TouristComplicationChallenge WatchKit Extension
//
//  Created by Thiago-Bernardes on 4/6/16.
//  Copyright © 2016 TB. All rights reserved.
//

import ClockKit


class ComplicationController: NSObject, CLKComplicationDataSource {
    
    
    // MARK: - Placeholder Templates
    
    func getPlaceholderTemplateForComplication(complication: CLKComplication, withHandler handler: (CLKComplicationTemplate?) -> Void) {
        // This method will be called once per supported complication, and the results will be cached
        
        if complication.family == .UtilitarianLarge {
          
            let complicationTemplate = CLKComplicationTemplateUtilitarianLargeFlat()
            complicationTemplate.textProvider = CLKSimpleTextProvider(text: "05:50 - 😎")
            handler(complicationTemplate)
        }
        

    }
    
    // MARK: - Timeline Configuration
    
    func getSupportedTimeTravelDirectionsForComplication(complication: CLKComplication, withHandler handler: (CLKComplicationTimeTravelDirections) -> Void) {
        handler([.Forward, .Backward])
    }
    

    
    // MARK: - Timeline Population
    
    func getCurrentTimelineEntryForComplication(complication: CLKComplication, withHandler handler: ((CLKComplicationTimelineEntry?) -> Void)) {
        // Call the handler with the current timeline entry
        
        
        var emoji = "🤑"
        if TaskModel.completedTasks().count < 3 {
           emoji = "😐"
        }
        
        if complication.family == .UtilitarianLarge {
            
            let complicationTemplate = CLKComplicationTemplateUtilitarianLargeFlat()
            complicationTemplate.textProvider = CLKSimpleTextProvider(text: ("6:40" + emoji))
            let complicationEntry = CLKComplicationTimelineEntry(date: NSDate(), complicationTemplate: complicationTemplate)
            handler(complicationEntry)
        }
        
        handler(nil)
        
        
    }
    
    func reloadData() {
        // 1
        let server = CLKComplicationServer.sharedInstance()
        guard let complications = server.activeComplications
            where complications.count > 0 else { return }
        
        for complication in complications  {
            server.reloadTimelineForComplication(complication)
        }

    }

    
  
    
}
