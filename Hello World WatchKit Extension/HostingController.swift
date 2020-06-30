//
//  HostingController.swift
//  Hello World WatchKit Extension
//
//  Created by Emma Allegrucci on 6/26/20.
//  Copyright © 2020 Emma Allegrucci. All rights reserved.
//

import WatchKit
import Foundation
import SwiftUI

class HostingController: WKHostingController<RootView> {
    override var body: RootView {
        return RootView()
    }
}
