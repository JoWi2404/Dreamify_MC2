import SwiftUI
import AVKit

struct ImageData {
    let name: String
    let title: String
    let audio: String
    let description: String
    let caption: String
}

struct Library2View: View {
    @State private var isShowingDetail = false
    @State private var isPlaying = false
    @State private var nowPlayingTitle = ""

    let images = [
        ImageData(name: "Enchanted Garden", title: "Enchanted Garden", audio: "audio1", description: "When we think of a garden, we often imagine a place full of brightly glazed flowers along with the sound of pristine water fountain. Have you actually visited a garden who possess these traits? Even if you haven't, worry not. Cover your eyes and experience it yourself as you fall deep into slumber.", caption: "Narrator Volume"),
        ImageData(name: "Oceanic Venture", title: "Oceanic Venture", audio: "audio2", description: "Whatever lies deep in the ocean will forever remain a mystery. Have you ever wondered what it feels to sail through the magnificent colossus sized of water? Before you fall deeper into your unconscious state, let's have a quick venture, shall we?", caption: "Narrator Volume"),
        ImageData(name: "Merchant of Hearts", title: "Merchant of Hearts", audio: "audio3", description: "Adora was a reputable merchant for her expertise in potions, vials, and spells that could help with all kinds of love troubles. Despite being called the infamous Merchant of Hearts, Adora stumbled into a love problem with Mark, the guy whom she fell in love with. Can her potion brewing and enchantments be able to fix it? ", caption: "Narrator Volume"),
        ImageData(name: "Grumpy Dorian", title: "Grumpy Dorian", audio: "audio5", description: "You spilled on his favorite jacket? Unforgivable! Dorian was merely a little kid with a big temper. Whoever got in his way, they’re deemed unforgivable by this grumpy little kid. Are you one of those people, perhaps?", caption: "Narrator Volume")
    ]

    var body: some View {
        NavigationStack {
            VStack {
                
                List {
                    Section(header:
                                //Select Story Title
                        Text("Select Stories")
                            .foregroundColor(Color(hex: 0xF7E5B6))
                            .font(.title.bold())
                            .textCase(.none) // Menonaktifkan konversi huruf kapital
                            .padding(.top, 50)
                            .padding(.bottom, 10)
                 

                    ) {
                        //Horizontal Scroll Story
                        ScrollView(.horizontal, showsIndicators: false) {
                            LazyHGrid(rows: [GridItem(.flexible())]) {
                                ForEach(images, id: \.name) { image in
                                    VStack{
                                        Rectangle()
                                          .foregroundColor(.clear)
                                          .frame(width: 304, height: 356)
                                          .background(
                                            Image(image.name)
                                              .resizable()
                                              .aspectRatio(contentMode: .fill)
                                              .frame(width: 304, height: 356)
                                              .clipped()
                                          )
                                          .cornerRadius(11)
                                        
                                        VStack {
                                            Rectangle()
                                              .foregroundColor(.clear)
                                              .frame(width: 305, height: 182)
                                              .background(.black.opacity(0.21))
                                              .overlay(
                                                VStack{
                                                    //Title Text
                                                    HStack {
                                                        Text(image.title)
                                                            .font(
                                                        Font.custom("SF Pro", size: 22)
                                                        .weight(.bold))
                                                            .foregroundColor(Color(red: 0.97, green: 0.9, blue: 0.71))
                                                        .padding(.bottom, 5)
                                                        
                                                        
                                                        //Duration Text
                                                        Text("10:53")
                                                          .font(
                                                            Font.custom("SF Pro Text", size: 12)
                                                              .weight(.semibold)
                                                          )
                                                          .multilineTextAlignment(.center)
                                                          .foregroundColor(.white.opacity(0.5))

                                                    }
                                                    //Description Text
                                                    Text(image.description)
                                                      .font(Font.custom("SF Pro Text", size: 11))
                                                      .kerning(0.06)
                                                      .foregroundColor(.white)
                                                      .frame(width: 280, height: 65, alignment: .leading)
                                                    Spacer()
                                                }
                                              )
                                              .cornerRadius(11)
                                            
                                        }
                                    }
                                    .frame(width: 365, height: 534)
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
                
                .navigationBarBackButtonHidden(true)
            }
            .background(Color(hex: 0x574D82))
            .scrollContentBackground(.hidden)
            
        }
        .navigationBarHidden(true)
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
