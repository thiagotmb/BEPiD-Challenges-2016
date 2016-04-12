//
//  ComplicationController.swift
//  WeatherForecasts WatchKit Extension
//
//  Created by Thiago-Bernardes on 4/8/16.
//  Copyright © 2016 TB. All rights reserved.
//

import ClockKit


class ComplicationController: NSObject, CLKComplicationDataSource {
    
    // MARK: - Timeline Configuration
    
    func getSupportedTimeTravelDirectionsForComplication(complication: CLKComplication, withHandler handler: (CLKComplicationTimeTravelDirections) -> Void) {
        handler([.Forward, .Backward])
    }
    
    func getTimelineStartDateForComplication(complication: CLKComplication, withHandler handler: (NSDate?) -> Void) {
        
        let firstForecast = ForecastsModel.getArrayDictionary().firstObject
        handler(firstForecast?["dateWind"] as? NSDate)
    }
    
    func getTimelineEndDateForComplication(complication: CLKComplication, withHandler handler: (NSDate?) -> Void) {
        let lastForecast = ForecastsModel.getArrayDictionary().lastObject
        handler(lastForecast?["dateWind"] as? NSDate)
    }
    
    func getPrivacyBehaviorForComplication(complication: CLKComplication, withHandler handler: (CLKComplicationPrivacyBehavior) -> Void) {
        handler(.ShowOnLockScreen)
    }
    
    // MARK: - Timeline Population
    
    func getCurrentTimelineEntryForComplication(complication: CLKComplication, withHandler handler: ((CLKComplicationTimelineEntry?) -> Void)) {
        // Call the handler with the current timeline entry
        let currentComplication = getComplicationTemplateForDate(complication, date: NSDate())
        let entry = CLKComplicationTimelineEntry(date: NSDate(), complicationTemplate: currentComplication)
        handler(entry)
    }
    
    func getTimelineEntriesForComplication(complication: CLKComplication, beforeDate date: NSDate, limit: Int, withHandler handler: (([CLKComplicationTimelineEntry]?) -> Void)) {
        
        let foreCasts = ForecastsModel.getForecastsBefore(date)
        
        let entries = foreCasts.flatMap { currentForecast in
            CLKComplicationTimelineEntry(
                date: currentForecast["dateWind"] as! NSDate,
                complicationTemplate: getComplicationTemplateForDate(complication, date: currentForecast["dateWind"] as! NSDate))
        }

        handler(entries)
    }
    
    func getTimelineEntriesForComplication(complication: CLKComplication, afterDate date: NSDate, limit: Int, withHandler handler: (([CLKComplicationTimelineEntry]?) -> Void)) {
        // Call the handler with the timeline entries after to the given date
        
        let foreCasts = ForecastsModel.getForecastsAfter(date)
        
        let entries = foreCasts.flatMap { currentForecast in
            CLKComplicationTimelineEntry(
                date: currentForecast["dateWind"] as! NSDate,
                complicationTemplate: getComplicationTemplateForDate(complication, date: currentForecast["dateWind"] as! NSDate))
        }
        
        handler(entries)
    }
    
    // MARK: - Update Scheduling
    
    func getNextRequestedUpdateDateWithHandler(handler: (NSDate?) -> Void) {
        // Call the handler with the date when you would next like to be given the opportunity to update your complication content
        let oneDayInterval = NSTimeInterval(60*60*24)
        handler(NSDate().dateByAddingTimeInterval(oneDayInterval));
    }
    
    // MARK: - Placeholder Templates
    
    func getPlaceholderTemplateForComplication(complication: CLKComplication, withHandler handler: (CLKComplicationTemplate?) -> Void)  {
        // This method will be called once per supported complication, and the results will be cached
        let template = getComplicationTemplateForDate(complication, date: NSDate(),isTemplate: true)
        handler(template)
        
    }
    
    func getComplicationTemplateForDate(complication: CLKComplication,date: NSDate, isTemplate: Bool = false) -> CLKComplicationTemplate{
        
        var forecast = ["dateWind": NSDate(), "velocity": "30"]
        if !isTemplate {
            forecast = ForecastsModel.getForecastOf(date)
        }
        if complication.family == .ModularLarge {
            let complicationTemplate = CLKComplicationTemplateModularLargeStandardBody()
            complicationTemplate.headerTextProvider = CLKSimpleTextProvider(text: "Wind Forecasts")
            complicationTemplate.body1TextProvider = CLKSimpleTextProvider(text: "Speed: \((forecast["velocity"] as! NSString))")
            complicationTemplate.body2TextProvider = CLKSimpleTextProvider(text: "\((forecast["dateWind"] as! NSDate))")

            return complicationTemplate
        }
        return CLKComplicationTemplate()
    }

    func getTimelineAnimationBehaviorForComplication(complication: CLKComplication, withHandler handler: (CLKComplicationTimelineAnimationBehavior) -> Void) {
        handler(CLKComplicationTimelineAnimationBehavior.Grouped)
    }
}
