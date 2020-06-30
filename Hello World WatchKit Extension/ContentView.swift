//
//  ContentView.swift
//  Hello World WatchKit Extension
//
//  Created by Emma Allegrucci on 6/26/20.
//  Copyright © 2020 Emma Allegrucci. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    //let data = HelloWorldData()
    
    @EnvironmentObject var model: FirebaseServices
    //model.getFirebaseTasks()
    var body: some View {
        //Text(data.name)
        VStack{
        List {
            ForEach(self.model.data.filter{!($0.mapValue.fields.isPersistent.booleanValue)}, id: \.mapValue.fields.id.stringValue) { item in
                VStack(alignment: .leading) {
                    if item.mapValue.fields.isAvailable.booleanValue {
                        if item.mapValue.fields.photo.stringValue != "" {
                                HStack {
                                    Text(item.mapValue.fields.title.stringValue)
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(FirebaseServices())
    }
}
