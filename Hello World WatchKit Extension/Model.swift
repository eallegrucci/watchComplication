//
//  Model.swift
//  Hello World WatchKit Extension
//
//  Created by Harshit Trehan on 6/28/20.
//  Copyright © 2020 Emma Allegrucci. All rights reserved.
//

import Foundation

struct Firebase: Codable {
    var name: String?
    var createTime, updateTime: String?
    var fields: FirebaseFields
}

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

class FirebaseServices{

    func getFirebaseData(completion: @escaping ([Value]) -> ()) {
            guard let url = URL(string: "https://firestore.googleapis.com/v1/projects/project-caitlin-c71a9/databases/(default)/documents/users/anaqPz2mmo3tSGU4lgB4") else { return }
            
            URLSession.shared.dataTask(with: url) { (data, _, _) in
                let data = try! JSONDecoder().decode(Firebase.self, from: data!)
                DispatchQueue.main.async {
                    completion(data.fields.goalsRoutines.arrayValue.values)
                }
            }
        .resume()
    }


}
