//
//  DetailView.swift
//  Dreamify
//
//  Created by Kelly Florences Tanjaya on 27/06/23.
//

import SwiftUI

//struct DetailView: View {
//    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//    }
//}
//
//struct DetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailView()
//    }
//}


struct DetailView: View {
    let imageData: ImageData
    
    @State private var isPlaying: Bool = false
    @State private var playbackProgress: Float = 0.5
    @State private var isLiked: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 30) {
                Image(imageData.name)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 300, height: 300)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    .padding(.top, 20) // Menambahkan jarak pada bagian atas gambar
                    .padding()
                    .padding()
                
                HStack {
                    Spacer()
                            .frame(width: 30)
                    Text(imageData.title)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color(hex: 0xF7E5B6))
                    Spacer()
                    
                    Button(action: {
                        isLiked.toggle()
                        // Implement action for like button
                    }) {
                        Image(systemName: isLiked ? "heart.fill" : "heart")
                            .font(.title)
                            .foregroundColor(isLiked ? .red : .gray)
                    }
                    .buttonStyle(BorderlessButtonStyle())
                    
                }
                .padding(.horizontal)
                
                Slider(value: $playbackProgress)
                    .accentColor(.green)
                    .frame(width: UIScreen.main.bounds.width - 100) // Menyesuaikan panjang slider
                    .padding(.horizontal)

                
                HStack {
                    Spacer()
                    
                    Button(action: {
                        // Implement action for rewind button
                    }) {
                        Image(systemName: "gobackward.15")
                            .font(.largeTitle)
                    }
                    .buttonStyle(BorderlessButtonStyle())
                    .foregroundColor(Color(hex: 0xF7E5B6))
                    
                    Spacer()
                    
                    Button(action: {
                        togglePlayback()
                    }) {
                        Image(systemName: isPlaying ? "pause.fill" : "play.fill")
                            .font(.system(size: 50))
                            .foregroundColor(Color(hex: 0xF7E5B6))
                    }
                    .buttonStyle(BorderlessButtonStyle())
                    
                    Spacer()
                    
                    Button(action: {
                        // Implement action for fast forward button
                    }) {
                        Image(systemName: "goforward.15")
                            .font(.largeTitle)
                    }
                    .buttonStyle(BorderlessButtonStyle())
                    .foregroundColor(Color(hex: 0xF7E5B6))
                    
                    Spacer()
                }
                .padding(.horizontal)
                .padding()
                
                Text(imageData.caption)
                    .font(.headline)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                
                Slider(value: $playbackProgress)
                    .accentColor(.green)
                    .frame(width: UIScreen.main.bounds.width - 100) // Menyesuaikan panjang slider
                    .padding(.horizontal)

                
                Spacer()
            }
            .background(Color(hex: 0x574D82))
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarHidden(true)
        }
    }
    
    private func togglePlayback() {
        isPlaying.toggle()
    }
}

