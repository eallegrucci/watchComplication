//
//  Model.swift
//  Hello World WatchKit Extension
//
//  Created by Harshit Trehan on 6/28/20.
//  Copyright © 2020 Emma Allegrucci. All rights reserved.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//let firebase = try? newJSONDecoder().decode(Firebase.self, from: jsonData)

import Foundation
import Combine
import WatchKit

// MARK: - Firebase
struct Firebase: Codable {
    var name: String?
    var createTime, updateTime: String?
    var fields: FirebaseFields
}

//Tasks Fields:
struct FirebaseTask: Codable {
    var name: String?
    var createTime, updateTime: String?
    var fields: FirebaseTaskFields
}

struct FirebaseTaskFields: Codable {
    var actionsTasks: ActionsTasks
    var completed: HavePic
    var title: EmailID
    
    enum CodingKeys: String, CodingKey {
        case actionsTasks = "actions&tasks"
        case completed
        case title
    }
}

struct FirebaseStep: Codable {
    var name: String?
    var createTime, updateTime: String?
    var fields: FirebaseStepFields
}

struct FirebaseStepFields: Codable {
    var instructionsSteps: ActionsTasks
    //var completed: HavePic
    var title: EmailID
    
    enum CodingKeys: String, CodingKey {
        case instructionsSteps = "instructions&steps"
        //case completed = "completed"
        case title
    }
}
// MARK: - FirebaseFields
struct FirebaseFields: Codable {
    var emailID, lastName, firstName: EmailID
    var aboutMe: AboutMe
    var goalsRoutines: GoalsRoutines
    var googleAuthToken, googleRefreshToken: EmailID

    enum CodingKeys: String, CodingKey {
        case emailID = "email_id"
        case lastName = "last_name"
        case firstName = "first_name"
        case aboutMe = "about_me"
        case goalsRoutines = "goals&routines"
        case googleAuthToken = "google_auth_token"
        case googleRefreshToken = "google_refresh_token"
    }
}

// MARK: - AboutMe
struct AboutMe: Codable {
    var mapValue: AboutMeMapValue
}

// MARK: - AboutMeMapValue
struct AboutMeMapValue: Codable {
    var fields: PurpleFields
}

// MARK: - PurpleFields
struct PurpleFields: Codable {
    var havePic: HavePic
    var pic, messageDay, messageCard: EmailID

    enum CodingKeys: String, CodingKey {
        case havePic = "have_pic"
        case pic
        case messageDay = "message_day"
        case messageCard = "message_card"
    }
}

// MARK: - HavePic
struct HavePic: Codable {
    var booleanValue: Bool
}

// MARK: - EmailID
struct EmailID: Codable {
    var stringValue: String
}

// MARK: - GoalsRoutines
struct GoalsRoutines: Codable {
    var arrayValue: GoalsRoutinesArrayValue
}

// MARK: - ArrayValue
struct GoalsRoutinesArrayValue: Codable {
    var values: [Value]
}

// MARK: - Value
struct Value: Codable {
    var mapValue: ValueMapValue
}

// MARK: - ValueMapValue
struct ValueMapValue: Codable {
    var fields: FluffyFields
}

struct ActionsTasks: Codable {
    var arrayValue: ActionsTasksArrayValue
}

// MARK: - ArrayValue
struct ActionsTasksArrayValue: Codable {
    var values: [ValueTask]
}

// MARK: - Value
struct ValueTask: Codable {
    var mapValue: TaskValueMapValue
}

// MARK: - ValueMapValue
struct TaskValueMapValue: Codable {
    var fields: TaskFluffyFields
}

struct TaskFluffyFields: Codable {
    var availableStartTime, availableEndTime: EmailID
    var datetimeStarted, datetimeCompleted: EmailID
    var isAvailable, isComplete: HavePic
    //var isMustDo: EmailID
    //var isSublistAvailable: HavePic
    var photo, id, title: EmailID
    
    enum CodingKeys: String, CodingKey {
        //case isSublistAvailable = "is_sublist_available"
        case isComplete = "is_complete"
        case availableStartTime = "available_start_time"
        case isAvailable = "is_available"
        //case isMustDo = "is_must_do"
        case availableEndTime = "available_end_time"
        case datetimeCompleted = "datetime_completed"
        case datetimeStarted = "datetime_started"
        case photo, id, title
    }
}

// MARK: - FluffyFields
struct FluffyFields: Codable {
    var isSublistAvailable, isComplete: HavePic
    var availableStartTime: EmailID
    var isPersistent: HavePic
    var datetimeCompleted, expectedCompletionTime: EmailID
    var isTimed: HavePic
    var isInProgress: HavePic?
    var datetimeStarted, audio, availableEndTime: EmailID
    var userNotifications: Notifications
    var id, title: EmailID
    var taNotifications: Notifications
    var photo: EmailID
    var isAvailable: HavePic
    var startDayAndTime: EmailID
    var endDayAndTime: EmailID
    var isDisplayedToday: HavePic

    enum CodingKeys: String, CodingKey {
        case isSublistAvailable = "is_sublist_available"
        case isComplete = "is_complete"
        case availableStartTime = "available_start_time"
        case isPersistent = "is_persistent"
        case datetimeCompleted = "datetime_completed"
        case expectedCompletionTime = "expected_completion_time"
        case isTimed = "is_timed"
        case isInProgress = "is_in_progress"
        case datetimeStarted = "datetime_started"
        case audio
        case availableEndTime = "available_end_time"
        case userNotifications = "user_notifications"
        case id, title
        case taNotifications = "ta_notifications"
        case photo
        case isAvailable = "is_available"
        case startDayAndTime = "start_day_and_time"
        case endDayAndTime = "end_day_and_time"
        case isDisplayedToday = "is_displayed_today"
    }
}

// MARK: - Notifications
struct Notifications: Codable {
    var mapValue: TaNotificationsMapValue
}

// MARK: - TaNotificationsMapValue
struct TaNotificationsMapValue: Codable {
    var fields: TentacledFields
}

// MARK: - TentacledFields
struct TentacledFields: Codable {
    var before, during, after: After
}

// MARK: - After
struct After: Codable {
    var mapValue: AfterMapValue
}

// MARK: - AfterMapValue
struct AfterMapValue: Codable {
    var fields: StickyFields
}

// MARK: - StickyFields
struct StickyFields: Codable {
    var message: EmailID
    var isSet, isEnabled: HavePic
    var time: EmailID
    var dateSet: EmailID?

    enum CodingKeys: String, CodingKey {
        case message
        case isSet = "is_set"
        case isEnabled = "is_enabled"
        case time
        case dateSet = "date_set"
    }
}

class FirebaseServices: ObservableObject {
    
    static let shared = FirebaseServices()
    
    @Published var data: [Value]?
    private var task: [ValueTask]?
    @Published var goalsSubtasks = [String: [ValueTask]?]()
    
     private init() {
        getFirebaseData(){
            (data) in self.data = data
            if let data = data {
                for goal in data {
                    self.getFirebaseTasks(goalID: goal.mapValue.fields.id.stringValue){
                        (task) in self.task = task
                        if let task = task {
                            self.goalsSubtasks[goal.mapValue.fields.id.stringValue] = task
                        }
                    }
                    self.task = []
                }
            }
        }
    }
    
    func getFirebaseData(completion: @escaping ([Value]?) -> ()) {
            guard let url = URL(string: "https://firestore.googleapis.com/v1/projects/project-caitlin-c71a9/databases/(default)/documents/users/VzYNSZMGGRrtzm74zPmM") else { return }
            print("here")
            URLSession.shared.dataTask(with: url) { (data, _, _) in
                let data = try? JSONDecoder().decode(Firebase.self, from: data!)
                DispatchQueue.main.async {
                    completion(data?.fields.goalsRoutines.arrayValue.values ?? nil)
                }
            }
        .resume()
    }
    
    func getFirebaseTasks(goalID: String, completion: @escaping ([ValueTask]?) -> ()) {
        print("here in task")
        var TaskUrl = "https://firestore.googleapis.com/v1/projects/project-caitlin-c71a9/databases/(default)/documents/users/VzYNSZMGGRrtzm74zPmM/goals&routines/"
        TaskUrl.append(goalID)
        print(TaskUrl)
        guard let url = URL(string: TaskUrl) else { return }
            
            URLSession.shared.dataTask(with: url) { (data, _, _) in
                let data = try? JSONDecoder().decode(FirebaseTask.self, from: data!)
                DispatchQueue.main.async {
                    completion(data?.fields.actionsTasks.arrayValue.values ?? nil)
                }
            }
        .resume()
    }
}

class BackgroundService: NSObject {
    static let shared = BackgroundService()
    static let url = URL(string: "https://firestore.googleapis.com/v1/projects/project-caitlin-c71a9/databases/(default)/documents/users/VzYNSZMGGRrtzm74zPmM")!
    
    // Store tasks in order to complete them when finished
    var pendingBackgroundTasks = [WKURLSessionRefreshBackgroundTask]()
    
    func updateContent(completion: () -> ()) {
        let configuration = URLSessionConfiguration
            .background(withIdentifier: "complicationUpdate")
        
        let session = URLSession(configuration: configuration,
                                 delegate: self, delegateQueue: nil)
        
        let backgroundTask = session.downloadTask(with: BackgroundService.url)
        backgroundTask.resume()
    }
    
    
    func handleDownload(_ backgroundTask: WKURLSessionRefreshBackgroundTask) {
        let configuration = URLSessionConfiguration
            .background(withIdentifier: backgroundTask.sessionIdentifier)
        
        let _ = URLSession(configuration: configuration,
                           delegate: self, delegateQueue: nil)
        
        pendingBackgroundTasks.append(backgroundTask)
    }
}

extension BackgroundService : URLSessionDownloadDelegate {
    func urlSession(_ session: URLSession,
                    downloadTask: URLSessionDownloadTask,
                    didFinishDownloadingTo location: URL) {
        
        processFile(file: location)
        
        self.pendingBackgroundTasks.forEach {
            $0.setTaskCompletedWithSnapshot(false)
        }
    }
    
    func processFile(file: URL){
        if let data = try? Data(contentsOf: file),
            let model = try? JSONDecoder().decode(Firebase.self, from: data) {
                //data?.fields.goalsRoutines.arrayValue.values ?? nil
            FirebaseServices.shared.data = model.fields.goalsRoutines.arrayValue.values
            print("Successsssss :::::::::")
        }
    }
}
