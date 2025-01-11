//
//  productivity_appApp.swift
//  productivity-app
//
//  Created by Sam Yin on 10/1/2025.
//

import SwiftUI
import FirebaseCore

@main
struct productivity_appApp: App {
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
