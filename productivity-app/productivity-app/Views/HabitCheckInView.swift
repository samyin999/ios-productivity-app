//
//  HabitCheckInView.swift
//  productivity-app
//
//  Created by Sam Yin on 11/1/2025.
//

import SwiftUI

struct HabitCheckInView: View {
    @StateObject private var viewModel = HabitViewModel()
    
    // For testing purposes, we'll hardcode these IDs
    let habitId = "test_habit"
    let userId = "current_user"
    let friendId = "friend_user"
    
    var body: some View {
        VStack(spacing: 20) {
            HStack(spacing: 30) {
                StatusIndicator(isCheckedIn: viewModel.isCheckedIn, name: "You")
                StatusIndicator(isCheckedIn: viewModel.friendCheckedIn, name: "Friend")
            }
            
            Button(action: {
                viewModel.checkIn(habitId: habitId, userId: userId)
            }) {
                Text("Check In")
                    .font(.title2)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(viewModel.isCheckedIn ? Color.gray : Color.blue)
                    .cornerRadius(12)
            }
            .disabled(viewModel.isCheckedIn)
        }
        .padding()
        .onAppear {
            viewModel.observeCheckIns(habitId: habitId, userId: userId, friendId: friendId)
        }
    }
}

struct StatusIndicator: View {
    let isCheckedIn: Bool
    let name: String
    
    var body: some View {
        VStack {
            Circle()
                .fill(isCheckedIn ? Color.green : Color.gray)
                .frame(width: 60, height: 60)
            Text(name)
                .font(.caption)
        }
    }
}
