//
//  Habit.swift
//  productivity-app
//
//  Created by Sam Yin on 11/1/2025.
//

import Foundation
import FirebaseFirestore

struct Habit {
    let id: String
    let title: String
    let participants: [User]
    let dailyCheckIns: [String: [String]]
}

struct User {
    let id: String
    let name: String
    let email: String
    let habits: [String]
}
