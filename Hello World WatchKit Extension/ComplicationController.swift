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
    //let title = model.data.mapValue.fields.title.stringValue
    
    // MARK: - Timeline Configuration
    func getSupportedTimeTravelDirections(for complication: CLKComplication, withHandler handler: @escaping (CLKComplicationTimeTravelDirections) -> Void) {
        handler([.forward])
    }
    
    func getTimelineStartDate(for complication: CLKComplication, withHandler handler: @escaping (Date?) -> Void) {
        print("getTimelineStartDate")
        handler(Date() - TimeInterval(5.0 * 60.0))
    }
    
    func getTimelineEndDate(for complication: CLKComplication, withHandler handler: @escaping (Date?) -> Void) {
        print("getTimelineEndDate")
        handler(Date().addingTimeInterval(70.0 * 60.0))
    }
    
    func getPrivacyBehavior(for complication: CLKComplication, withHandler handler: @escaping (CLKComplicationPrivacyBehavior) -> Void) {
        handler(.showOnLockScreen)
    }
    
    // MARK: - Timeline Population
    
    func getCurrentTimelineEntry(for complication: CLKComplication, withHandler handler: @escaping (CLKComplicationTimelineEntry?) -> Void) {
        // Call the handler with the current timeline entry
        //handler(graphicRectangular)
        handler(createTimelineEntry(forComplication: complication, date: Date()))
    }
    
    private func createNewEntry(info: String, forComplication complication: CLKComplication, date: Date) {
        
    }
    
    private func createTimelineEntry(forComplication complication: CLKComplication, date: Date) -> CLKComplicationTimelineEntry {
        // Get the correct template based on the complication.
        let percentage: Float = 25/60
        let graphicRectangular = CLKComplicationTemplateGraphicRectangularTextGauge()
        graphicRectangular.headerTextProvider = CLKSimpleTextProvider(text: data.name)
        graphicRectangular.body1TextProvider = CLKSimpleTextProvider(text: data.info)
        graphicRectangular.gaugeProvider = CLKSimpleGaugeProvider(style: .fill, gaugeColors: [UIColor.green], gaugeColorLocations: nil, fillFraction: percentage)
        let template = graphicRectangular
        
        
        // Use the template and date to create a timeline entry.
        return CLKComplicationTimelineEntry(date: date, complicationTemplate: template)
    }
    
    func getTimelineEntries(for complication: CLKComplication,
                            after date: Date,
                            limit: Int,
                            withHandler handler: @escaping ([CLKComplicationTimelineEntry]?) -> Void) {
        print("getTimelineEntries")
        let fiveMinutes = 10 * 60.0
        let oneHour = 60.0 * 60.0
        
        // Create an array to hold the timeline entries.
        var entries = [CLKComplicationTimelineEntry]()
        
        // Calculate the start and end dates.
        var current = date.addingTimeInterval(fiveMinutes)
        let endDate = date.addingTimeInterval(oneHour + (2*fiveMinutes))
        
        // Create a timeline entry for every five minutes from the starting time.
        // Stop once you reach the limit or the end date.
        
        while (current.compare(endDate) == .orderedAscending) && (entries.count < limit) {
            entries.append(createTimelineEntry(forComplication: complication, date: current))
            current = current.addingTimeInterval(fiveMinutes)
        }
        
        handler(entries)
    }
    
    // MARK: - Placeholder Templates
    
    let HOUR: TimeInterval = 60 * 60
    let MINUTE: TimeInterval = 60
    
    
    func getLocalizableSampleTemplate(for complication: CLKComplication, withHandler handler: @escaping (CLKComplicationTemplate?) -> Void) {
        // This method will be called once per supported complication, and the results will be cached
//        let future = Date().addingTimeInterval(25.0 * 60.0 * 60.0)
//        let template = createTemplate(forComplication: complication, date: future)
//        handler(template)
//        let future = Date().addingTimeInterval(25.0 * 60.0 * 60.0)
//        let template = createTemplate(forComplication: complication, date: future)
//        handler(template)
        var template: CLKComplicationTemplate?
            switch complication.family {
            case .modularSmall:
                let modularSmallTemplate =
                    CLKComplicationTemplateModularSmallRingText()
                modularSmallTemplate.textProvider =
                    CLKSimpleTextProvider(text: "R")
                modularSmallTemplate.fillFraction = 0.75
                modularSmallTemplate.ringStyle = CLKComplicationRingStyle.closed
                template = modularSmallTemplate
            case .modularLarge:
                let modularLargeTemplate =
                    CLKComplicationTemplateModularLargeStandardBody()
                modularLargeTemplate.headerTextProvider =
                    CLKTimeIntervalTextProvider(start: NSDate() as Date,
                                                end: NSDate(timeIntervalSinceNow: 1.5 * HOUR) as Date)
                modularLargeTemplate.body1TextProvider =
                    CLKSimpleTextProvider(text: "Movie Name",
                        shortText: "Movie")
                modularLargeTemplate.body2TextProvider =
                    CLKSimpleTextProvider(text: "Running Time",
                        shortText: "Time")
                template = nil
            case .utilitarianSmall:
                template = nil
            case .utilitarianLarge:
                template = nil
            case .circularSmall:
                template = nil
            case .utilitarianSmallFlat:
                template = nil
            case .extraLarge:
                template = nil
            case .graphicCorner:
                template = nil
            case .graphicBezel:
                template = nil
            case .graphicCircular:
                template = nil
            case .graphicRectangular:
                let graphicRectangular = CLKComplicationTemplateGraphicRectangularTextGauge()
                graphicRectangular.headerTextProvider = CLKSimpleTextProvider(text: data.name)
                graphicRectangular.body1TextProvider = CLKSimpleTextProvider(text: data.info)
                graphicRectangular.gaugeProvider = CLKSimpleGaugeProvider(style: .fill, gaugeColors: [UIColor.green], gaugeColorLocations: nil, fillFraction: Float())
                handler(graphicRectangular)
                return
//                template = graphicRectangular
            @unknown default:
                template = nil
        }
        handler(template)
    }
    
//    private func createTemplate(forComplication complication: CLKComplication, date: Date) -> CLKComplicationTemplate {
//    switch complication.family {
//    case .modularSmall:
//        return createModularSmallTemplate(forDate: date)
//    case .modularLarge:
//        return createModularLargeTemplate(forDate: date)
//    case .utilitarianSmall, .utilitarianSmallFlat:
//        return createUtilitarianSmallFlatTemplate(forDate: date)
//    case .utilitarianLarge:
//        return createUtilitarianLargeTemplate(forDate: date)
//    case .circularSmall:
//        return createCircularSmallTemplate(forDate: date)
//    case .extraLarge:
//        return createExtraLargeTemplate(forDate: date)
//    case .graphicCorner:
//        return createGraphicCornerTemplate(forDate: date)
//    case .graphicCircular:
//        return createGraphicCircleTemplate(forDate: date)
//    case .graphicRectangular:
//        return createGraphicRectangularTemplate(forDate: date)
//    case .graphicBezel:
//        return createGraphicBezelTemplate(forDate: date)
}
    
//    private func createTemplate(forComplication complication: CLKComplication, date: Date) -> CLKComplicationTemplate {
//        switch complication.family {
//        case .modularSmall:
//            return createModularSmallTemplate(forDate: date)
//        case .modularLarge:
//            return createModularLargeTemplate(forDate: date)
//        case .utilitarianSmall, .utilitarianSmallFlat:
//            return createModularLargeTemplate(forDate: date)
//        case .utilitarianLarge:
//            return createModularLargeTemplate(forDate: date)
//        case .circularSmall:
//            return createModularLargeTemplate(forDate: date)
//        case .extraLarge:
//            return createModularLargeTemplate(forDate: date)
//        case .graphicCorner:
//            return createModularLargeTemplate(forDate: date)
//        case .graphicCircular:
//            return createModularLargeTemplate(forDate: date)
//        case .graphicRectangular:
//            return createModularLargeTemplate(forDate: date)
//        case .graphicBezel:
//            return createModularLargeTemplate(forDate: date)
//        }
//    }
//
//    private func createModularSmallTemplate(forDate date: Date) -> CLKComplicationTemplate {
//        let modularSmallTemplate =
//            CLKComplicationTemplateModularSmallRingText()
//        modularSmallTemplate.textProvider =
//            CLKSimpleTextProvider(text: "R")
//        modularSmallTemplate.fillFraction = 0.75
//        modularSmallTemplate.ringStyle = CLKComplicationRingStyle.closed
//        return modularSmallTemplate
//    }
//
//    private func createModularLargeTemplate(forDate date: Date) -> CLKComplicationTemplate {
//        let modularLargeTemplate =
//            CLKComplicationTemplateModularLargeStandardBody()
//        modularLargeTemplate.headerTextProvider =
//            CLKTimeIntervalTextProvider(start: NSDate() as Date,
//                                        end: NSDate(timeIntervalSinceNow: 1.5 * HOUR) as Date)
//        modularLargeTemplate.body1TextProvider =
//            CLKSimpleTextProvider(text: "Movie Name",
//                shortText: "Movie")
//        modularLargeTemplate.body2TextProvider =
//            CLKSimpleTextProvider(text: "Running Time",
//                shortText: "Time")
//        return modularLargeTemplate
//    }
    
//    private func createUtilitarianSmallFlatTemplate(forDate date: Date) -> CLKComplicationTemplate {}
//    private func createUtilitarianLargeTemplate(forDate date: Date) -> CLKComplicationTemplate {}
//    private func createCircularSmallTemplate(forDate date: Date) -> CLKComplicationTemplate {}
//    private func createExtraLargeTemplate(forDate date: Date) -> CLKComplicationTemplate {}
//    private func createGraphicCornerTemplate(forDate date: Date) -> CLKComplicationTemplate {}
//    private func createGraphicCircleTemplate(forDate date: Date) -> CLKComplicationTemplate {}
//    private func createGraphicRectangularTemplate(forDate date: Date) -> CLKComplicationTemplate {}
//    private func createGraphicBezelTemplate(forDate date: Date) -> CLKComplicationTemplate {}
