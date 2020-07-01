//
//  ComplicationController.swift
//  Movies WatchKit Extension
//
//  Created by Emma Allegrucci on 6/24/20.
//  Copyright © 2020 Emma Allegrucci. All rights reserved.
//

import ClockKit

let timeLeft: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "E, dd MMM yyyy HH:mm:ss Z"
    //formatter2.dateFormat = "dd MM yyyy'T'HH:mm:ss'Z'"
    formatter.timeZone = .current
    print(formatter.timeZone!)
    return formatter
}()

let formatter: DateFormatter = {
    let formatter1 = DateFormatter()
    formatter1.dateFormat = "hh:mm:ss"
    return formatter1
}()

class ComplicationController: NSObject, CLKComplicationDataSource {
    
    let data = HelloWorldData()
    lazy var data1 = FirebaseServices.shared
    //let model = FirebaseServices()
    //let title = model.data.mapValue.fields.title.stringValue
    
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
        
        if complication.family == .graphicRectangular {
            
            let percentage: Float = 25/60
            
            let time = timeLeft.date(from: data1.data![0].mapValue.fields.startDayAndTime.stringValue)
            
            let graphicRectangular = CLKComplicationTemplateGraphicRectangularTextGauge()
            graphicRectangular.headerTextProvider = CLKSimpleTextProvider(text: data1.data![0].mapValue.fields.title.stringValue)
            
            graphicRectangular.body1TextProvider = CLKSimpleTextProvider(text: formatter.string(from: time!))
            
            graphicRectangular.gaugeProvider = CLKSimpleGaugeProvider(style: .fill, gaugeColors: [UIColor.green], gaugeColorLocations: nil, fillFraction: percentage)
            
            let template = graphicRectangular
            let timelineEntry = CLKComplicationTimelineEntry(date: time!, complicationTemplate: template)
            
            print("Here.")
            handler(timelineEntry)
        }
        else {
            handler(nil)
        }
    }
    
    /*
    private func createTimelineEntry(forComplication complication: CLKComplication, date: Date) -> CLKComplicationTimelineEntry {
        
        let template = createTemplate(forDate: date)
        
        return CLKComplicationTimelineEntry(date: date, complicationTemplate: template)
    }
    
    private func createTemplate(forDate date: Date){
        let complicationTitle = CLKSimpleTextProvider(text: data1.data![0].mapValue.fields.title.stringValue)
    }
 */
    func getTimelineEntries(for complication: CLKComplication,
                            after date: Date,
                            limit: Int,
                            withHandler handler: @escaping ([CLKComplicationTimelineEntry]?) -> Void) {
        print("getTimelineEntries")
        
        var timeLineEntries = [CLKComplicationTimelineEntry]()
        
        for index in 1...(data1.data!.count-1) {
             let percentage: Float = 25/60
                       
            let time = timeLeft.date(from: data1.data![index].mapValue.fields.startDayAndTime.stringValue)
                       
            let graphicRectangular = CLKComplicationTemplateGraphicRectangularTextGauge()
                    graphicRectangular.headerTextProvider = CLKSimpleTextProvider(text: data1.data![index].mapValue.fields.title.stringValue)
                       
            graphicRectangular.body1TextProvider = CLKSimpleTextProvider(text: formatter.string(from: time!))
                       
            graphicRectangular.gaugeProvider = CLKSimpleGaugeProvider(style: .fill, gaugeColors: [UIColor.green], gaugeColorLocations: nil, fillFraction: percentage)
                       
            let template = graphicRectangular
            let timelineEntry = CLKComplicationTimelineEntry(date: time!, complicationTemplate: template)
                       
            print("Here.")
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
