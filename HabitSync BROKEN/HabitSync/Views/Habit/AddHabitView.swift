//
//  AddHabitView.swift
//  HabitSync
//
//  Created by Sam Yin on 14/1/2025.
//

import SwiftUI

struct AddHabitView: View {
    @Environment(\.dismiss) private var dismiss
    @ObservedObject var viewModel: HabitViewModel
    @State private var title = ""
    @State private var description = ""
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Habit Title", text: $title)
                TextField("Description (optional)", text: $description)
            }
            .navigationTitle("Add New Habit")
            .navigationBarItems(
                leading: Button("Cancel") { dismiss() },
                trailing: Button("Save") {
                    viewModel.addHabit(title: title, description: description)
                    dismiss()
                }
                .disabled(title.isEmpty)
            )
        }
    }
}
