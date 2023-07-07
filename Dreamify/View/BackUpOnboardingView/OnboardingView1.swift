//
//  OnboardingView1.swift
//  Dreamify
//
//  Created by Kelly Florences Tanjaya on 27/06/23.
//

import SwiftUI

struct OnboardingView1_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView1()
    }
}


struct OnboardingView1: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Image("Background")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Spacer()
                    Image("Bulan")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding()
                    
                    Text("Welcome to\nDreamify!")
                                           .font(.title)
                                           .foregroundColor(Color(hex: 0xF7E5B6))
                                           .fontWeight(.bold)
                                           .multilineTextAlignment(.center)
                                           .lineLimit(2) // Mengatur batas dua baris
                                           .minimumScaleFactor(0.5) // Mengatur faktor skala minimum
                                           .padding()
                    
                    Text("Are you ready to fall into a deep slumber?")
                        .font(.body)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding()
                    
                    Spacer()
                    
                    VStack {
                        HStack(spacing: 10) {
                            CircleView(selected: true)
                            CircleView(selected: false)
                            CircleView(selected: false)
                        }
                        .padding(.bottom, 20)
                        
                        NavigationLink(destination: OnboardingView2()) {
                            Text("Next")
                                .font(.headline)
                                .foregroundColor(.purple)
                                .padding(.vertical, 10) // Reduce vertical padding
                                .padding(.horizontal, 40) // Reduce horizontal padding
                                .background(Color.white) // Set white background
                                .cornerRadius(10)
                                .clipShape(Capsule())
                        }
                        .padding(.bottom, 30) // Penyesuaian posisi tombol
                    }
                }
                .padding()
            }
            .statusBar(hidden: true)
        }
    }
}
