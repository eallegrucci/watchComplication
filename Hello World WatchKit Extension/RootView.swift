//
//  RootView.swift
//  Hello World WatchKit Extension
//
//  Created by Harshit Trehan on 6/29/20.
//  Copyright © 2020 Emma Allegrucci. All rights reserved.
//

import SwiftUI

struct RootView: View {
    @State private var model = FirebaseServices()
    var body: some View {
        ContentView().environmentObject(model)
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
