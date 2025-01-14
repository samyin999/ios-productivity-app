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
    var description: String?
    var isCompleted: Bool
    var createdAt: Date
    
    init(id: String? = nil,
         title: String,
         description: String? = nil,
         isCompleted: Bool = false,
         createdAt: Date = Date()) {
        self.id = id
        self.title = title
        self.description = description
        self.isCompleted = isCompleted
        self.createdAt = createdAt
    }
}
