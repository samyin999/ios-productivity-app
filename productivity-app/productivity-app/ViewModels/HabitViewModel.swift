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
    @Published var isCheckedIn = false
    @Published var friendCheckedIn = false
    
    func checkIn(habitId: String, userId: String) {
        let today = Date().formatted(date: .numeric, time: .omitted)
        
        db.collection("habits")
            .document(habitId)
            .collection("checkIns")
            .document(today)
            .setData([
                userId: Timestamp(date: Date())
            ], merge: true) { error in
                if let error = error {
                    print("Error checking in: \(error)")
                } else {
                    self.isCheckedIn = true
                }
            }
    }
    
    func observeCheckIns(habitId: String, userId: String, friendId: String) {
        let today = Date().formatted(date: .numeric, time: .omitted)
        
        db.collection("habits")
            .document(habitId)
            .collection("checkIns")
            .document(today)
            .addSnapshotListener { snapshot, error in
                guard let data = snapshot?.data() else { return }
                
                self.isCheckedIn = data[userId] != nil
                self.friendCheckedIn = data[friendId] != nil
            }
    }
}
