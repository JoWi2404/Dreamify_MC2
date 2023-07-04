//
//  DreamifyApp.swift
//  Dreamify
//
//  Created by Joey Wiryawan on 21/06/23.
//

import SwiftUI

@main
struct DreamifyApp: App {
    @StateObject private var speechRecognizer = SpeechRecognizer.shared
    var body: some Scene {
        WindowGroup {
            OnboardingView()
                .environmentObject(speechRecognizer)
        }
    }
}
