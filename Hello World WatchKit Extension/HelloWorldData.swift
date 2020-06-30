//
//  HelloWorldData.swift
//  Emma's Watch App WatchKit Extension
//
//  Created by Emma Allegrucci on 6/26/20.
//  Copyright © 2020 Emma Allegrucci. All rights reserved.
//

import Foundation
import Combine
import ClockKit

class Data: ObservableObject {
    public let name: String
    public let startTime: Date
    public let endTime: Date
    
    init(name: String, startTime: Date, endTime: Date) {
        self.name = name
        self.startTime = startTime
        self.endTime = endTime
    }
}

class HelloWorldData: ObservableObject {
    
    public var listOfData = [Data]()
    
    init() {
        let date = Date()
        
        let data1 = Data(name: "Goal 1", startTime: date, endTime: date.advanced(by: 1*60))
        self.listOfData.append(data1)
        
        let data2 = Data(name: "Goal 2", startTime: date.advanced(by: 1*60), endTime: date.advanced(by: 2*60))
        self.listOfData.append(data2)
        
        let data3 = Data(name: "Goal 3", startTime: date.advanced(by: 2*60), endTime: date.advanced(by: 3*60))
        self.listOfData.append(data3)
    }
}
    
    
//    @Published public var currentInfo: String = ""
    
    // A sink that is also called whenever the currentDrinks array changes.
//    var updateSink: AnyCancellable!
    
//    init() {
//
//        // Add a subscriber to currentDrinks that responds whenever currentDrinks changes.
//        updateSink = $currentInfo.sink { [unowned self] _ in
//
//            // Update any complications on active watch faces.
//            let server = CLKComplicationServer.sharedInstance()
//            for complication in server.activeComplications ?? [] {
//                server.reloadTimeline(for: complication)
//            }
//        }
//    }
    
//    deinit {
//        updateSink.cancel()
//    }
