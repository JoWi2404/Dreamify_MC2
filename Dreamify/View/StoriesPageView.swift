//
//  StoriesPageView.swift
//  Dreamify
//
//  Created by Joey Wiryawan on 22/06/23.
//

import SwiftUI


struct StoriesPageView: View {
    
    let PageTitle: String
    var body: some View {
        NavigationStack{
            VStack{
                HStack{
                   Text(PageTitle)
                        .font(
                        Font.custom("SF Pro", size: 35)
                        .weight(.bold)
                        )
                        .foregroundColor(Color(red: 0.97, green: 0.9, blue: 0.71))
                        .frame(width: 195, height: 43, alignment: .topLeading)
                    Spacer()
                }.padding(.horizontal)
                    .padding(.top)
                
                ScrollView(.horizontal, showsIndicators: false){
                    HStack(alignment: .top, spacing: 16) {
                        ForEach(imagesName, id: \.self) { _ in Rectangle()
                                .foregroundColor(.clear)
                                .frame(width: 279, height: 371)
                                .background(
                                  Image("grumpy_dorian")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 279, height: 371)
                                    .clipped()
                                )
                                .cornerRadius(11)
                        }
                        }
                    }
                }
            .frame(width: 393, height: 853)
            .background(
            LinearGradient(
            stops: [
            Gradient.Stop(color: Color(red: 0.16, green: 0.12, blue: 0.19), location: 0.09),
            Gradient.Stop(color: Color(red: 0.34, green: 0.3, blue: 0.51), location: 1.00),
            ],
            startPoint: UnitPoint(x: 1, y: 0.48),
            endPoint: UnitPoint(x: 0, y: 0.48)))
            }
        }
    }

struct StoriesPageView_Previews: PreviewProvider {
    static var previews: some View {
        StoriesPageView(PageTitle: "Select Story")
    }
}
