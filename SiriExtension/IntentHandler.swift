//
//  IntentHandler.swift
//  SiriExtension
//
//  Created by Kelly Florences Tanjaya on 10/07/23.
//

import Intents

// As an example, this class is set up to handle Message intents.
// You will want to replace this or add other intents as appropriate.
// The intents you wish to handle must be declared in the extension's Info.plist.

// You can test your example integration by saying things to Siri like:
// "Send a message using <myApp>"
// "<myApp> John saying hello"
// "Search for messages in <myApp>"

class IntentHandler: INExtension, INPlayMediaIntentHandling {
    
    func handle(intent: INPlayMediaIntent, completion: @escaping (INPlayMediaIntentResponse) -> Void) {
        // Extract necessary information from the intent, such as media item identifiers or media item search terms
        
        // Check the requested app name
        if let appName = appNameFromMediaItem(intent.mediaItems) {
            if appName.localizedCaseInsensitiveContains("Dreamify") {
                // Handle the request to play audio in Dreamify
                print("playAudioInDreamify")
                
                let response = INPlayMediaIntentResponse(code: .success, userActivity: nil)
                completion(response)
            } else {
                // Handle other requested apps or unsupported app names
                print("error 1")
                let response = INPlayMediaIntentResponse(code: .failureRequiringAppLaunch, userActivity: nil)
                completion(response)
            }
        } else {
            // Handle case when app name cannot be determined
            print("error 2")
            let response = INPlayMediaIntentResponse(code: .failure, userActivity: nil)
            completion(response)
        }
        
        print("yay")
    }

    func resolveMediaItems(for intent: INPlayMediaIntent, with completion: @escaping ([INPlayMediaMediaItemResolutionResult]) -> Void) {
        // Resolve the media items requested by the user and provide resolution results
        
        // Use INPlayMediaMediaItemResolutionResult.success(with:) or INPlayMediaMediaItemResolutionResult.needsValue() depending on your logic
        
        let resolutionResults: [INPlayMediaMediaItemResolutionResult] = []
        completion(resolutionResults)
    }
    
    private func appNameFromMediaItem(_ mediaItem: [INMediaItem]?) -> String? {
        guard let identifier = mediaItem?.first else {
            return nil
        }
        // Extract the app name from the media item identifier or other properties
        // Replace the placeholder code below with your logic to extract the app name
        return identifier.identifier // Replace with the actual app name
    }

    // Implement other methods of the INPlayMediaIntentHandling protocol if needed
}
