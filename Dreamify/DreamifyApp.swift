//
//  DreamifyApp.swift
//  Dreamify
//
//  Created by Joey Wiryawan on 21/06/23.
//

import SwiftUI
import AVKit
import Intents
import SiriExtension

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
    
//    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
//
//        let audioSession = AVAudioSession.sharedInstance()
//        do {
//            try audioSession.setCategory(AVAudioSession.Category.playback, mode: AVAudioSession.Mode.default)
//        } catch let error as NSError {
//            print("Setting category to AVAudioSessionCategoryPlayback failed: \(error)")
//        }
//        // Other project setup
//        return true
//    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
            
        // Set up audio session
        let audioSession = AVAudioSession.sharedInstance()
        do {
            try audioSession.setCategory(AVAudioSession.Category.playback, mode: AVAudioSession.Mode.default)
        } catch let error as NSError {
            print("Setting category to AVAudioSessionCategoryPlayback failed: \(error)")
        }
        
        // SiriKit intent handler registration
        INInteraction(intent: INPlayMediaIntent(), response: nil).donate { (error) in
            if let error = error {
                print("Failed to donate interaction: \(error.localizedDescription)")
            } else {
                print("Successfully donated interaction")
            }
        }
        // Other project setup
        
        return true
    }
}
