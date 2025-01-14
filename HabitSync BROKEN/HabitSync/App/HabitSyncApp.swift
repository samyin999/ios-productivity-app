//
//  HabitSyncApp.swift
//  HabitSync
//
//  Created by Sam Yin on 10/1/2025.
//

import SwiftUI
import FirebaseCore

@main
struct HabitSyncApp: App {
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
