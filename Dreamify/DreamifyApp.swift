//
//  DreamifyApp.swift
//  Dreamify
//
//  Created by Joey Wiryawan on 21/06/23.
//

import SwiftUI

@main
struct DreamifyApp: App {
    @AppStorage("isOnboarding") var isOnboarding: Bool = true

    var body: some Scene {
        WindowGroup {
            if isOnboarding{
                OnboardingView()
            }else{
                Library2View()
            }
        }
    }
}
