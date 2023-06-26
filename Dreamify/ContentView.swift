//
//  ContentView.swift
//  Dreamify
//
//  Created by Joey Wiryawan on 21/06/23.
//

import SwiftUI

struct ContentView: View {
    @State private var value: Double = 0.5

        var body: some View {
            VStack {
                Slider(value: $value, in: 0...1, step: 0.001)
                    .accentColor(.red) // Customize the appearance of the slider track
                    

                // Display the value of the slider
                Text("\(value)")
                    .font(.title)
                    .padding()
            }
            .padding()
        }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


