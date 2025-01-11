//
//  ContentView.swift
//  productivity-app
//
//  Created by Sam Yin on 10/1/2025.
//

import SwiftUI
import FirebaseAnalytics

//struct ContentView: View {
//    var body: some View {
//        VStack {
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundStyle(.tint)
//            Text("Hello, world!")
//        }
//        .padding()
//        .onAppear {
//            Analytics.logEvent("app_opened", parameters: nil)
//            print("firebase is working!!!!!!!!!!!!!")
//        }
//    }
//}

struct ContentView: View {
    var body: some View {
        HabitCheckInView()
    }
}

#Preview {
    ContentView()
}
