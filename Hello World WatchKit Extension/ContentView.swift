//
//  ContentView.swift
//  Hello World WatchKit Extension
//
//  Created by Emma Allegrucci on 6/26/20.
//  Copyright © 2020 Emma Allegrucci. All rights reserved.
//

import SwiftUI

struct TasksView: View {
    @ObservedObject private var model = FirebaseServices.shared
    var goalID: String
    
    var body: some View{
        ZStack{
            if (self.model.goalsSubtasks[self.goalID] == nil) {
                Text("Oops! No actions and tasks found!")
            }
            else {
                List {
                    ForEach(self.model.goalsSubtasks[self.goalID]!!, id: \.mapValue.fields.id.stringValue) { item in
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
}

struct ContentView: View {
    //let model = FirebaseServices.shared
    @ObservedObject private var model = FirebaseServices.shared
    //model.getFirebaseTasks()
    var body: some View {
        //Text(data.name)
        VStack{
            List {
                if (self.model.data == nil){
                    Text("Oops")
                }
                else{
                    ForEach(self.model.data!.filter{!($0.mapValue.fields.isPersistent.booleanValue)}, id: \.mapValue.fields.id.stringValue) { item in
                    VStack(alignment: .leading) {
                        if item.mapValue.fields.isAvailable.booleanValue {
                            if item.mapValue.fields.photo.stringValue != "" {
                                NavigationLink(destination: TasksView(goalID: item.mapValue.fields.id.stringValue)){
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
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()//.environmentObject(FirebaseServices())
    }
}
