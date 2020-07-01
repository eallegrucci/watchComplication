//
//  HelloWorldData.swift
//  Emma's Watch App WatchKit Extension
//
//  Created by Emma Allegrucci on 6/26/20.
//  Copyright © 2020 Emma Allegrucci. All rights reserved.
//

import Foundation
import SwiftUI
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
        
        let data1 = Data(name: "Goal 1", startTime: date, endTime: date.advanced(by: 30))
        self.listOfData.append(data1)
        
        let data2 = Data(name: "Goal 2", startTime: date.advanced(by: 30), endTime: date.advanced(by: 60))
        self.listOfData.append(data2)
        
        let data3 = Data(name: "Goal 3", startTime: date.advanced(by: 60), endTime: date.advanced(by: 90))
        self.listOfData.append(data3)
    }
}
