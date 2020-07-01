//
//  ComplicationController.swift
//  Movies WatchKit Extension
//
//  Created by Emma Allegrucci on 6/24/20.
//  Copyright © 2020 Emma Allegrucci. All rights reserved.
//

import ClockKit

class ComplicationController: NSObject, CLKComplicationDataSource {
    
    let data = HelloWorldData()
    //let model = FirebaseServices()
    
    // MARK: - Timeline Configuration
    func getSupportedTimeTravelDirections(for complication: CLKComplication, withHandler handler: @escaping (CLKComplicationTimeTravelDirections) -> Void) {
        handler([.forward])
    }
    
    func getTimelineStartDate(for complication: CLKComplication, withHandler handler: @escaping (Date?) -> Void) {
        let currentDate = Date()
        handler(currentDate)
    }
    
    func getTimelineEndDate(for complication: CLKComplication, withHandler handler: @escaping (Date?) -> Void) {
        var currentDate = Date()
        currentDate.addTimeInterval(24*60*60)
        handler(currentDate)
    }
    
    func getPrivacyBehavior(for complication: CLKComplication, withHandler handler: @escaping (CLKComplicationPrivacyBehavior) -> Void) {
        handler(.showOnLockScreen)
    }
    
    // MARK: - Timeline Population
    
    func getCurrentTimelineEntry(for complication: CLKComplication, withHandler handler: @escaping (CLKComplicationTimelineEntry?) -> Void) {
        // Call the handler with the current timeline entry
        if complication.family == .graphicRectangular {
            let percentage: Float = 25/60
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "hh:mm:ss"
            let timeString = dateFormatter.string(from: data.listOfData[0].startTime) + " - " + dateFormatter.string(from:  data.listOfData[0].endTime)
            let graphicRectangular = CLKComplicationTemplateGraphicRectangularTextGauge()
            graphicRectangular.headerTextProvider = CLKSimpleTextProvider(text: data.listOfData[0].name)
            graphicRectangular.body1TextProvider = CLKSimpleTextProvider(text: timeString)
            graphicRectangular.gaugeProvider = CLKSimpleGaugeProvider(style: .fill, gaugeColors: [UIColor.green], gaugeColorLocations: nil, fillFraction: percentage)
            let template = graphicRectangular
            let timelineEntry = CLKComplicationTimelineEntry(date: data.listOfData[0].startTime, complicationTemplate: template)
            
            handler(timelineEntry)
        }
        else {
            handler(nil)
        }
    }
    
    private func createNewEntry(info: String, forComplication complication: CLKComplication, date: Date) {
        
    }
    
    func getTimelineEntries(for complication: CLKComplication,
                            after date: Date,
                            limit: Int,
                            withHandler handler: @escaping ([CLKComplicationTimelineEntry]?) -> Void) {
        print("getTimelineEntries")
//        let fiveMinutes = 10 * 60.0
//        let oneHour = 60.0 * 60.0
//
//        // Create an array to hold the timeline entries.
//        var entries = [CLKComplicationTimelineEntry]()
//
//        // Calculate the start and end dates.
//        var current = date.addingTimeInterval(fiveMinutes)
//        let endDate = date.addingTimeInterval(oneHour + (2*fiveMinutes))
//
//        // Create a timeline entry for every five minutes from the starting time.
//        // Stop once you reach the limit or the end date.
//
//        while (current.compare(endDate) == .orderedAscending) && (entries.count < limit) {
//            entries.append(createTimelineEntry(forComplication: complication, date: current))
//            current = current.addingTimeInterval(fiveMinutes)
//        }
        var timeLineEntries = [CLKComplicationTimelineEntry]()
        
        for index in 1...(data.listOfData.count-1) {
            let percentage: Float = 25/60
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "hh:mm:ss"
            let timeString = dateFormatter.string(from: data.listOfData[index].startTime) + " - " + dateFormatter.string(from:  data.listOfData[index].endTime)
            let graphicRectangular = CLKComplicationTemplateGraphicRectangularTextGauge()
            graphicRectangular.headerTextProvider = CLKSimpleTextProvider(text: data.listOfData[index].name)
            graphicRectangular.body1TextProvider = CLKSimpleTextProvider(text: timeString)
            graphicRectangular.gaugeProvider = CLKSimpleGaugeProvider(style: .fill, gaugeColors: [UIColor.green], gaugeColorLocations: nil, fillFraction: percentage)
            let template = graphicRectangular
            let timelineEntry = CLKComplicationTimelineEntry(date: data.listOfData[index].startTime, complicationTemplate: template)
            timeLineEntries.append(timelineEntry)
        }
        
        handler(timeLineEntries)
    }
    
    // MARK: - Placeholder Templates
    
    func getLocalizableSampleTemplate(for complication: CLKComplication, withHandler handler: @escaping (CLKComplicationTemplate?) -> Void) {
        // This method will be called once per supported complication, and the results will be cached
//        let future = Date().addingTimeInterval(25.0 * 60.0 * 60.0)
//        let template = createTemplate(forComplication: complication, date: future)
//        handler(template)
//        let future = Date().addingTimeInterval(25.0 * 60.0 * 60.0)
//        let template = createTemplate(forComplication: complication, date: future)
//        handler(template)
//        var template: CLKComplicationTemplate?
        if complication.family == .graphicRectangular{
            let graphicRectangular = CLKComplicationTemplateGraphicRectangularTextGauge()
            graphicRectangular.headerTextProvider = CLKSimpleTextProvider(text: "Goal")
            graphicRectangular.body1TextProvider = CLKSimpleTextProvider(text: "Time - Time")
            graphicRectangular.gaugeProvider = CLKSimpleGaugeProvider(style: .fill, gaugeColors: [UIColor.green], gaugeColorLocations: nil, fillFraction: Float())
            handler(graphicRectangular)
        } else {
            handler(nil)
        }
    }
}
