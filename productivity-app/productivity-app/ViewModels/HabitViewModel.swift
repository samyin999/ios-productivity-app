//
//  HabitViewModel.swift
//  productivity-app
//
//  Created by Sam Yin on 11/1/2025.
//

import Foundation
import FirebaseFirestore

class HabitViewModel: ObservableObject {
    private let db = Firestore.firestore()
    @Published var habits: [Habit] = []
    @Published var users: [User] = []
    
    init() {
        fetchDummyData()
    }
    
    private func fetchDummyData() {
        // Create dummy users
        let user1 = User(id: "user1", username: "Alice", displayPicture: "user1_avatar", points: 100, yesterdayCheckIns: ["habit1": true, "habit2": false], todayCheckIns: ["habit1": false, "habit2": false])
        let user2 = User(id: "user2", username: "Bob", displayPicture: "user2_avatar", points: 80, yesterdayCheckIns: ["habit1": false, "habit2": true], todayCheckIns: ["habit1": false, "habit2": false])
        
        users = [user1, user2]
        
        // Create dummy habits
        let habit1 = Habit(id: "habit1", title: "Morning Workout", users: ["user1", "user2"], createdAt: Date().addingTimeInterval(-86400 * 7), updatedAt: Date())
        let habit2 = Habit(id: "habit2", title: "Read for 30 minutes", users: ["user1", "user2"], createdAt: Date().addingTimeInterval(-86400 * 3), updatedAt: Date())
        
        habits = [habit1, habit2]
    }
    
    func checkIn(habitId: String, userId: String) {
        guard let userIndex = users.firstIndex(where: { $0.id == userId }),
              let habitIndex = habits.firstIndex(where: { $0.id == habitId }) else {
            return
        }
        
        users[userIndex].todayCheckIns[habitId] = true
        users[userIndex].points += 10
        habits[habitIndex].updatedAt = Date()
        
        // In a real app, you would update Firestore here
    }
    
    func getUserName(for userId: String) -> String {
        users.first(where: { $0.id == userId })?.username ?? "Unknown User"
    }
    
    func getHabitTitle(for habitId: String) -> String {
        habits.first(where: { $0.id == habitId })?.title ?? "Unknown Habit"
    }
}
