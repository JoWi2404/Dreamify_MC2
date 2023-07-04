//
//  OnboardingView.swift
//  Dreamify
//
//  Created by Joey Wiryawan on 28/06/23.
//

import SwiftUI


struct OnboardingView: View {
    
    @AppStorage("isOnboarding") var isOnboarding: Bool?
    
    private let content: [[String]] = [
        ["Bulan","Welcome to Dreamify!", "Are you ready to fall into a deep slumber?"],
        ["Onboarding_voice_siri","Voice Recognition","Take control of the story with your voice to avoid direct contact with your phone."],
        ["Onboarding_focus_mode","Focus State Activation", "It will be automatically turned on when a story gets played to provide comfort for your sleep."]
    ]
    
    @State private var pageIndex = 0
    @State private var isOnboardingLocal: Bool = false
    @State private var isSkipped: Bool = false
    
    var body: some View {
        NavigationStack{
            VStack {
                HStack{
                    Spacer()
                    Button{
                        isSkipped = true
                        isOnboarding = !isSkipped
                    }label:{
                        Text("Skip")
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                    }
                    .navigationDestination(isPresented: $isSkipped){
                        Library2View()
                    }
                    .padding(.bottom, 0)
                }
                .padding(.bottom, 0)
                .padding(.top, 20)
                .padding(.horizontal, 30)
                
                TabView(selection: $pageIndex) {
                    ForEach(0...content.count - 1, id:\.self) { count in
                        VStack(spacing: 20) {
                            Spacer()
                            Image(content[count][0])
                                .resizable()
                                .scaledToFit()
                                .padding()
                            Text(content[count][1])
//                                .font(.largeTitle)
                                .font(.system(size: 42))
//                                .font(Font.custom("", size: 42).weight(.heavy))
                                .fontWeight(.heavy)
                                .foregroundColor(Color("lightYellow"))
                                .multilineTextAlignment(.center)
                                .frame(width: 300.0)
                            
                            Text(content[count][2])
                                .font(Font.custom("Inter", size: 13))
                                .multilineTextAlignment(.center)
                                .foregroundColor(.white)
                                .frame(width: 300)
                            Spacer()
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .tag(count)
                    }
                }
                .ignoresSafeArea()
                .tabViewStyle(.page)
                .indexViewStyle(.page(backgroundDisplayMode: .interactive))
//                .animation(.easeIn, value: true)

                
                if pageIndex == 2 {
                    
//                    NavigationLink{
//                        Library2View()
//                    } label: {
                        Button{
                            isOnboardingLocal = true
                            isOnboarding = !isOnboardingLocal
                        } label:{
                            Text("Start")
                                .fontWeight(.semibold)
                                .padding(.horizontal, 20)
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(.white)
                        .foregroundColor(Color("darkPurple"))
                        .cornerRadius(13)
                        .navigationDestination(isPresented: $isOnboardingLocal){
                            Library2View()
                        }
                }
                else {
                    NavigationLink {
                        
                    } label: {
                        ZStack{
                            Rectangle()
                            Text("Start")
                                .font(
                                    Font.custom("SF Pro Text", size: 20)
                                        .weight(.semibold)
                                )
                                .kerning(0.06)
                                .multilineTextAlignment(.center)
                                .foregroundColor(Color(red: 0.34, green: 0.3, blue: 0.51))
                                .frame(width: 69, height: 13, alignment: .center)
                        }
                        .frame(width: 126, height: 34)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                    }
                    .hidden()
                    .disabled(true)
                }
            }
            .background(
                LinearGradient(
                    stops: [
                        Gradient.Stop(color: Color(red: 0.34, green: 0.3, blue: 0.51), location: 0.00),
                        Gradient.Stop(color: Color(red: 0.16, green: 0.12, blue: 0.19), location: 1.00),
                    ],
                    startPoint: UnitPoint(x: 0, y: 0.01),
                    endPoint: UnitPoint(x: 1, y: 1)
                )
            )
        }
    }
    
    func incrementPage() {
        pageIndex += 1
    }
    
    func goToZero(){
        pageIndex = 0
    }
}



struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            OnboardingView()
        }
        
    }
}
