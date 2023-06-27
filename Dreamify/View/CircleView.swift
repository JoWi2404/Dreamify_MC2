//
//  CircleView.swift
//  Dreamify
//
//  Created by Kelly Florences Tanjaya on 27/06/23.
//

import SwiftUI

//struct CircleView: View {
//    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//    }
//}
//
struct CircleView_Previews: PreviewProvider {
    static var previews: some View {
        CircleView(selected: true)
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
