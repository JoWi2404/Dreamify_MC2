//
//  OnboardingView2.swift
//  Dreamify
//
//  Created by Kelly Florences Tanjaya on 27/06/23.
//

import SwiftUI

//struct OnboardingView2: View {
//    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//    }
//}
//
struct OnboardingView2_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView2()
    }
}


struct OnboardingView2: View {
    var body: some View {
        ZStack {
            Image("Background")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                
                Image("Onboarding_voice_siri")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding()
                
                Text("Voice\nRecognition")
                                       .font(.title)
                                       .foregroundColor(Color(hex: 0xF7E5B6))
                                       .fontWeight(.bold)
                                       .multilineTextAlignment(.center)
                                       .lineLimit(2) // Mengatur batas dua baris
                                       .minimumScaleFactor(0.5) // Mengatur faktor skala minimum
                                       .padding()
                
                Text("Take control of the story with your voice to avoid direct contact with your phone.")
                    .foregroundColor(.white)
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .padding()
                
                Spacer()
                
                VStack {
                    HStack(spacing: 10) {
                        CircleView(selected: false)
                        CircleView(selected: true)
                        CircleView(selected: false)
                    }
                    .padding(.bottom, 20)
                    
                    NavigationLink(destination: OnboardingView3()) {
                        Text("Next")
                            .font(.headline)
                            .foregroundColor(.purple)
                            .padding(.vertical, 10) // Reduce vertical padding
                            .padding(.horizontal, 40) // Reduce horizontal padding
                            .background(Color.white) // Set white background
                            .cornerRadius(10)
                            .clipShape(Capsule())
                    }
                    .padding(.bottom, 50) // Penyesuaian posisi tombol
                }
            }
            .padding()
        }
    }
}
