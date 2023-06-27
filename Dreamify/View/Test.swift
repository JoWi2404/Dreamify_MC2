//
//  Test.swift
//  Dreamify
//
//  Created by Joey Wiryawan on 22/06/23.
//

import SwiftUI

struct Test: View {
    @State private var search = ""
    
    var body: some View {
        NavigationStack{
            ScrollView {
                VStack{
                    Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                }
                .navigationTitle("Test")
            }
        }
    }
}

struct Test_Previews: PreviewProvider {
    static var previews: some View {
        Test()
    }
}
