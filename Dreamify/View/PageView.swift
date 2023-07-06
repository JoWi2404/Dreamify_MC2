//
//  PageView.swift
//  Dreamify
//
//  Created by Joey Wiryawan on 28/06/23.
//

import SwiftUI

struct PageView: View {
    var page: Page
    
    var body: some View {
        VStack(spacing: 20) {
            Image("\(page.imageURL)")
                .resizable()
                .scaledToFit()
                .padding()
            
            Text(page.name)
                .font(.title)
            Text(page.description)
                .font(.subheadline)
                .frame(width: 300)
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
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
        .edgesIgnoringSafeArea(.all) // Add this modifier to remove the white spaces
    }
}


struct PageView_Previews: PreviewProvider {
    static var previews: some View {
        PageView(page: Page.sample)
    }
}
