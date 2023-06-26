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
                    
                    Text("Welcome to Dreamify")
                        .font(.title)
                        .foregroundColor(Color(hex: 0xF7E5B6))
                        .fontWeight(.bold)
                        .padding()
                    
                    Text("Are you ready to fall into a deep slumber?")
                        .font(.body)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding()
                    
                    Spacer()
                    
                    NavigationLink(destination: OnboardingView2()) {
                        Text("Next")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(LinearGradient(gradient: Gradient(colors: [Color.purple, Color.blue]), startPoint: .leading, endPoint: .trailing))
                            .cornerRadius(10)
                            .padding(.horizontal)
                    }
                }
                .padding()
            }
            .statusBar(hidden: true)
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
                    
                    Text("Voice Recognition")
                        .foregroundColor(Color(hex: 0xF7E5B6))
                        .font(.title)
                        .fontWeight(.bold)
                        .padding()
                    
                    Text("Take control of the story with your voice to avoid direct contact with your phone.")
                        .foregroundColor(.white)
                        .font(.body)
                        .multilineTextAlignment(.center)
                        .padding()
                    
                    Spacer()
                    
                    NavigationLink(destination: OnboardingView3()) {
                        Text("Next")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(LinearGradient(gradient: Gradient(colors: [Color.purple, Color.blue]), startPoint: .leading, endPoint: .trailing))
                            .cornerRadius(10)
                            .padding(.horizontal)
                    }
                }
                .padding()
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
                        
                        Text("Focus State Activation")
                            .foregroundColor(Color(hex: 0xF7E5B6))
                            .font(.title)
                            .fontWeight(.bold)
                            .padding()
                        
                        Text("It will be automatically turned on when a story gets played to provide comfort for your sleep.")
                            .foregroundColor(.white)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding()
                        
                        Spacer()
                        
                        NavigationLink(destination: Library2View()) {
                            Text("Get Started")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(LinearGradient(gradient: Gradient(colors: [Color.purple, Color.blue]), startPoint: .leading, endPoint: .trailing))
                                .cornerRadius(10)
                                .padding(.horizontal)
                        }
                    }
                    .padding()
                }
            }
            
            struct ContentView: View {
                var body: some View {
                    Text("Main Content")
                        .font(.title)
                        .foregroundColor(.black)
                        .padding()
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
        }
    }
}
