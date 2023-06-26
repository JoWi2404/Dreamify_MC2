import SwiftUI

struct OnboardingView1: View {
    var body: some View {
        NavigationView {
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
                                .padding(.horizontal, 20) // Reduce horizontal padding
                                .background(Color.white) // Set white background
                                .cornerRadius(10)
                                .padding(.horizontal)
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
                            .padding(.horizontal, 20) // Reduce horizontal padding
                            .background(Color.white) // Set white background
                            .cornerRadius(10)
                            .padding(.horizontal)
                    }
                    .padding(.bottom, 50) // Penyesuaian posisi tombol
                }
            }
            .padding()
        }
    }
}

struct OnboardingView3: View {
    var body: some View {
        ZStack {
            Image("Background")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                
                Image("Onboarding_focus_mode")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding()
                
                Text("Focus State\nActivation")
                                       .font(.title)
                                       .foregroundColor(Color(hex: 0xF7E5B6))
                                       .fontWeight(.bold)
                                       .multilineTextAlignment(.center)
                                       .lineLimit(2) // Mengatur batas dua baris
                                       .minimumScaleFactor(0.5) // Mengatur faktor skala minimum
                                       .padding()
                
                Text("It will be automatically turned on when a story gets played to provide comfort for your sleep.")
                    .foregroundColor(.white)
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .padding()
                
                Spacer()
                
                VStack {
                    HStack(spacing: 10) {
                        CircleView(selected: false)
                        CircleView(selected: false)
                        CircleView(selected: true)
                    }
                    .padding(.bottom, 20)
                    
                    NavigationLink(destination: Library2View()) {
                        Text("Get Started")
                            .font(.headline)
                            .foregroundColor(.purple)
                            .padding(.vertical, 10) // Reduce vertical padding
                            .padding(.horizontal, 20) // Reduce horizontal padding
                            .background(Color.white) // Set white background
                            .cornerRadius(10)
                            .padding(.horizontal)
                    }
                    .padding(.bottom, 50) // Penyesuaian posisi tombol
                }
            }
            .padding()
        }
    }
}

struct CircleView: View {
    var selected: Bool
    
    var body: some View {
        Circle()
            .frame(width: 10, height: 10)
            .foregroundColor(selected ? Color(hex: 0xF7E5B6) : .white)
            .opacity(selected ? 1 : 0.4)
    }
}


struct OnboardingView1_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView1()
    }
}

struct OnboardingView2_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView2()
    }
}

struct OnboardingView3_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView3()
    }
}
