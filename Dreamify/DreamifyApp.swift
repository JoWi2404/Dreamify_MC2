//
//  DreamifyApp.swift
//  Dreamify
//
//  Created by Joey Wiryawan on 21/06/23.
//

import SwiftUI
import AVKit

@main
struct DreamifyApp: App {
    @AppStorage("isOnboarding") var isOnboarding: Bool = true
    @StateObject private var speechRecognizer = SpeechRecognizer.shared
    
    var body: some Scene {
        WindowGroup {
            if isOnboarding{
                OnboardingView()
                    .environmentObject(speechRecognizer)
            }else{
                SelectStoryView()
                    .environmentObject(speechRecognizer)
            }
        }
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        let audioSession = AVAudioSession.sharedInstance()
        do {
            try audioSession.setCategory(AVAudioSession.Category.playAndRecord, mode: AVAudioSession.Mode.default)
        } catch let error as NSError {
            print("Setting category to AVAudioSessionCategoryPlayback failed: \(error)")
        }
        // Other project setup
        return true
    }
}
