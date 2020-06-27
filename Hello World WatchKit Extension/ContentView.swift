//
//  ContentView.swift
//  Hello World WatchKit Extension
//
//  Created by Emma Allegrucci on 6/26/20.
//  Copyright © 2020 Emma Allegrucci. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let data = HelloWorldData()
    var body: some View {
        Text(data.name)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
