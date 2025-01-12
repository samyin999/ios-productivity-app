//
//  Habit.swift
//  HabitSync
//
//  Created by Sam Yin on 11/1/2025.
//

import Foundation
import FirebaseFirestore

struct Habit: Identifiable, Codable {
    @DocumentID var id: String?
    var title: String
    var users: [String]  // Array of user IDs
    var createdAt: Date
    var updatedAt: Date
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case users
        case createdAt
        case updatedAt
    }
}

struct User: Identifiable, Codable {
    @DocumentID var id: String?
    var username: String
    var displayPicture: String  // URL or path to the picture
    var points: Int
    var yesterdayCheckIns: [String: Bool]  // [HabitID: CheckedIn]
    var todayCheckIns: [String: Bool]  // [HabitID: CheckedIn]
    
    enum CodingKeys: String, CodingKey {
        case id
        case username
        case displayPicture
        case points
        case yesterdayCheckIns
        case todayCheckIns
    }
}
