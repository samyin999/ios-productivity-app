//
//  HabitListView.swift
//  HabitSync
//
//  Created by Sam Yin on 14/1/2025.
//

import SwiftUI

struct HabitListView: View {
    @StateObject private var viewModel = HabitViewModel()
    @State private var showingAddHabit = false
    
    var body: some View {
        NavigationView {
            List(viewModel.habits) { habit in
                HStack {
                    Text(habit.title)
                    Spacer()
                    Image(systemName: habit.isCompleted ? "checkmark.circle.fill" : "circle")
                        .foregroundColor(habit.isCompleted ? .green : .gray)
                        .onTapGesture {
                            viewModel.toggleHabit(habit)
                        }
                }
            }
            .navigationTitle("My Habits")
            .toolbar {
                Button(action: { showingAddHabit = true }) {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddHabit) {
                AddHabitView(viewModel: viewModel)
            }
        }
    }
}
