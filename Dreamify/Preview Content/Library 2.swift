import SwiftUI
import AVKit

struct ImageData {
    let name: String
    let title: String
    let audio: String
    let caption: String
}

struct Library2View: View {
    @State private var isShowingDetail = false
    @State private var isPlaying = false
    @State private var nowPlayingTitle = ""

    let images = [
        ImageData(name: "Gundam 1", title: "Title 1", audio: "audio1", caption: "Narrator Volume"),
        ImageData(name: "Gundam 2", title: "Title 2", audio: "audio2", caption: "Narrator Volume"),
        ImageData(name: "Gundam 3", title: "Title 3", audio: "audio3", caption: "Narrator Volume"),
        ImageData(name: "Gundam 4", title: "Title 4", audio: "audio4", caption: "Narrator Volume"),
        ImageData(name: "Gundam 5", title: "Title 5", audio: "audio5", caption: "Narrator Volume")
    ]

    var body: some View {
        NavigationView {
            VStack {
                List {
                    Section(header:
                                Text("Select Stories")
                                                .foregroundColor(Color(hex: 0xF7E5B6))
                                                .font(.title)
                                                .padding(.top, 50) // Menambahkan jarak pada bagian atas teks
                                                .padding(.bottom, 10) // Menambahkan jarak pada bagian bawah teks
                    ) {
                        ScrollView(.horizontal, showsIndicators: false) {
                            LazyHGrid(rows: [GridItem(.flexible())]) {
                                ForEach(images, id: \.name) { image in
                                    VStack {
                                        ZStack(alignment: .bottomLeading) {
                                            Image(image.name)
                                                .resizable()
                                                .aspectRatio(contentMode: .fill)
                                                .frame(width: 250, height: 450)
                                                .cornerRadius(8)
                                                .onTapGesture {
                                                    isShowingDetail = true
                                                }

                                            Color.black
                                                .opacity(0.5)
                                                .frame(height: 60)

                                            VStack(alignment: .leading) {
                                                Text(image.title)
                                                    .font(.headline)
                                                    .foregroundColor(.white)

                                                HStack {
                                                    Spacer()

                                                    Button(action: {
                                                        isPlaying.toggle()
                                                        nowPlayingTitle = image.title
                                                    }) {
                                                        Image(systemName: isPlaying ? "pause.circle.fill" : "play.circle.fill")
                                                            .font(.title)
                                                            .foregroundColor(.white)
                                                    }
                                                    .buttonStyle(BorderlessButtonStyle())
                                                }
                                                .padding(.vertical, 4)
                                                .padding(.horizontal)
                                                .background(Color.black.opacity(0.5))
                                                .cornerRadius(4)
                                            }
                                            .padding(.bottom, 8)
                                            .padding(.leading, 8)
                                            .animation(.default)
                                        }
                                        .background(BlurView(style: .systemUltraThinMaterial))
                                        .clipShape(RoundedRectangle(cornerRadius: 8))
                                        .onTapGesture {
                                            isShowingDetail = true
                                        }
                                        .sheet(isPresented: $isShowingDetail) {
                                            DetailView(imageData: image)
                                        }
                                    }
                                }
                            }
                            .padding(.horizontal)
                        }
                    }
                    .listRowBackground(Color(hex: 0x574D82))
                }
                .listStyle(InsetGroupedListStyle())
                
                VStack {
                    Rectangle()
                        .foregroundColor(.purple)
                        .frame(height: 50)
                        .overlay(
                            Button(action: {
                                // Tambahkan aksi yang diinginkan di sini
                            }) {
                                Image(systemName: "play.circle.fill")
                                    .font(.system(size: 30))
                                    .foregroundColor(.white)
                            }
                        )
                }
                .background(Color(hex: 0x574D82))
                .padding()
                .navigationBarTitle(".")
                .navigationBarBackButtonHidden(true)
            }
            .background(Color(hex: 0x574D82))
            .scrollContentBackground(.hidden)
            .navigationBarHidden(true)
        }
    }
}



// BlurView untuk latar belakang blur
struct BlurView: UIViewRepresentable {
    var style: UIBlurEffect.Style
    
    func makeUIView(context: UIViewRepresentableContext<BlurView>) -> UIView {
        let view = UIView(frame: CGRect.zero)
        view.backgroundColor = .clear
        
        let blurEffect = UIBlurEffect(style: style)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.translatesAutoresizingMaskIntoConstraints = false
        
        view.insertSubview(blurView, at: 0)
        
        NSLayoutConstraint.activate([
            blurView.heightAnchor.constraint(equalTo: view.heightAnchor),
            blurView.widthAnchor.constraint(equalTo: view.widthAnchor),
        ])
        
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<BlurView>) {}
}

struct DetailView: View {
    let imageData: ImageData
    
    @State private var isPlaying: Bool = false
    @State private var playbackProgress: Float = 0.5
    @State private var isLiked: Bool = false
    
    var body: some View {
        NavigationView {
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


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Library2View()
    }
}

// Mengkonversi string hex ke UIColor
extension Color {
    init(hex: UInt32) {
        let components = (
            R: CGFloat((hex >> 16) & 0xff) / 255,
            G: CGFloat((hex >> 08) & 0xff) / 255,
            B: CGFloat((hex >> 00) & 0xff) / 255
        )
        self.init(UIColor(red: components.R, green: components.G, blue: components.B, alpha: 1))
    }
}
