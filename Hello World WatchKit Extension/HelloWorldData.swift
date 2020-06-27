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

class HelloWorldData: ObservableObject {
    public let name: String = "Hello world"
    public var info: String = ""
    public var timeInfoDict: [Float: String] = [1: "About to start",
                                                2: "Starting",
                                                3: "Just missed it"]
    
    @Published public var currentInfo: String = ""
    
    // A sink that is also called whenever the currentDrinks array changes.
    var updateSink: AnyCancellable!
    
    init() {
        
        // Add a subscriber to currentDrinks that responds whenever currentDrinks changes.
        updateSink = $currentInfo.sink { [unowned self] _ in
            
            // Update any complications on active watch faces.
            let server = CLKComplicationServer.sharedInstance()
            for complication in server.activeComplications ?? [] {
                server.reloadTimeline(for: complication)
            }
        }
    }
    
    deinit {
        updateSink.cancel()
    }
    public func updateInfo(info: String) {
        self.info = info;
    }
    
//    public func timeLeft() -> Float {
//        var timeLeft: Float = 10
//
//        return timeLeft
//    }
        
//    public var currentTime: Float = 0
    
//    init(currentTime: Float) {
//        self.currentTime = currentTime
//    }
        
}
