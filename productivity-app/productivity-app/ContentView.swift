//
//  ContentView.swift
//  productivity-app
//
//  Created by Sam Yin on 10/1/2025.
//

import SwiftUI
import FirebaseAnalytics

struct ContentView: View {
    @StateObject private var viewModel = HabitViewModel()
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Habits")) {
                    ForEach(viewModel.habits) { habit in
                        HabitRow(habit: habit, viewModel: viewModel)
                    }
                }
                
                Section(header: Text("Users")) {
                    ForEach(viewModel.users) { user in
                        UserRow(user: user)
                    }
                }
            }
            .navigationTitle("Productivity App")
        }
        .onAppear {
            Analytics.logEvent("app_opened", parameters: nil)
        }
    }
}

struct HabitRow: View {
    let habit: Habit
    @ObservedObject var viewModel: HabitViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(habit.title)
                .font(.headline)
            HStack {
                ForEach(habit.users, id: \.self) { userId in
                    let user = viewModel.users.first(where: { $0.id == userId })
                    if let user = user {
                        Image(systemName: user.todayCheckIns[habit.id ?? ""] ?? false ? "checkmark.circle.fill" : "circle")
                            .foregroundColor(user.todayCheckIns[habit.id ?? ""] ?? false ? .green : .gray)
                        Text(user.username)
                            .font(.caption)
                    }
                }
            }
        }
    }
}

struct UserRow: View {
    let user: User
    
    var body: some View {
        HStack {
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: 40, height: 40)
            VStack(alignment: .leading) {
                Text(user.username)
                    .font(.headline)
                Text("Points: \(user.points)")
                    .font(.subheadline)
            }
        }
    }
}

#Preview {
    ContentView()
}
