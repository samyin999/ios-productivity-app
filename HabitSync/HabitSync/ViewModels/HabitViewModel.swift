//
//  HabitViewModel.swift
//  HabitSync
//
//  Created by Sam Yin on 11/1/2025.
//

import Foundation
import FirebaseFirestore

class HabitViewModel: ObservableObject {
    @Published var habits: [Habit] = []
    private let db = Firestore.firestore()
    
    func addHabit(title: String, description: String? = nil) {
        let newHabit = Habit(title: title, description: description)
        habits.append(newHabit)
        
        // Save to Firebase (you'll implement this later)
    }
    
    func toggleHabit(_ habit: Habit) {
        if let index = habits.firstIndex(where: { $0.id == habit.id }) {
            habits[index].isCompleted.toggle()
            // Update in Firebase (you'll implement this later)
        }
    }
}
