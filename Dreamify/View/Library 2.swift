import SwiftUI
import AVKit

struct ImageData: Identifiable {
    var id = UUID()
    let name: String
    let title: String
    let audio: String
    let description: String
    let caption: String
}

struct Library2View: View {
    @State private var isShowingDetail = false
    @State private var nowPlayingTitle = ""
    @State var isPresentSheet = false
    @State var selectedStory: ImageData = ImageData(name: "", title: "", audio: "", description: "", caption: "")
    @State var audioBrownNoise: AVAudioPlayer!
    @State var audioNarration: AVAudioPlayer!
    @State var isPlaying: Bool = false
    @State var buttonPlay = "pause.fill"
    @State private var timer: Timer? = nil
    @State var currentSec: Float = 0.0
    
    
    let images = [
        ImageData(name: "Enchanted Garden", title: "Enchanted Garden", audio: "Enchanted_Garden", description: "When we think of a garden, we often imagine a place full of brightly glazed flowers along with the sound of pristine water fountain. Have you actually visited a garden who possess these traits? Even if you haven't, worry not. Cover your eyes and experience it yourself as you fall deep into slumber.", caption: "Rain on Rooftop"),
        ImageData(name: "Oceanic Venture", title: "Oceanic Venture", audio: "Oceanic_Venture", description: "Whatever lies deep in the ocean will forever remain a mystery. Have you ever wondered what it feels to sail through the magnificent colossus sized of water? Before you fall deeper into your unconscious state, let's have a quick venture, shall we?", caption: "Crashing Waves"),
        ImageData(name: "Merchant of Hearts", title: "Merchant of Hearts", audio: "Merchant_of_Hearts", description: "Adora was a reputable merchant for her expertise in potions, vials, and spells that could help with all kinds of love troubles. Despite being called the infamous Merchant of Hearts, Adora stumbled into a love problem with Mark, the guy whom she fell in love with. Can her potion brewing and enchantments be able to fix it? ", caption: "Rain & Thunder"),
        ImageData(name: "Grumpy Dorian", title: "Grumpy Dorian", audio: "Grumpy_Dorian", description: "You spilled on his favorite jacket? Unforgivable! Dorian was merely a little kid with a big temper. Whoever got in his way, they’re deemed unforgivable by this grumpy little kid. Are you one of those people, perhaps?", caption: "Snowfall")
    ]
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 0){
                Text("Select Stories")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(Color("lightYellow"))
                    .multilineTextAlignment(.leading)
                    .padding()
                    .padding(.top, 30)
                VStack {
                    //Horizontal Scroll Story
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHGrid(rows: [GridItem(.flexible(), spacing: 5)]) {
                            ForEach(images, id: \.name) { image in
                                Button(action: {
                                    selectedStory = image
                                    isPresentSheet.toggle()
                                    if(image.title != nowPlayingTitle && nowPlayingTitle != ""){
                                        audioNarration.pause()
                                        audioBrownNoise.pause()
                                        isPlaying = false
                                    }
                                    //                                    if(isPlaying){
                                    //
                                    //                                    }
                                    nowPlayingTitle = image.title
                                    
                                    //                                    nowPlayingTitle =
                                }) {
                                    VStack(spacing: 0) {
                                        Image(image.name)
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 304, height: 356)
                                            .clipped()
                                            .padding(.bottom, 0)
                                            .cornerRadius(11)
                                        
                                        Rectangle()
                                            .padding(.top, 0)
                                            .foregroundColor(.clear)
                                            .frame(width: 305, height: 220)
                                            .background(Color(red: 0.15686, green: 0.129412, blue: 0.215686))
                                            .overlay(
                                                VStack {
                                                    HStack {
                                                        Text(image.title)
                                                            .font(.system(.title2))
                                                            .fontWeight(.heavy)
                                                            .foregroundColor(Color(red: 0.97, green: 0.9, blue: 0.71))
                                                            .padding(.bottom, 5)
                                                            .padding(.top, 10)
                                                        Spacer()
                                                        Text("10:53")
                                                            .font(Font.custom("SF Pro Text", size: 12).weight(.semibold))
                                                            .multilineTextAlignment(.leading)
                                                            .foregroundColor(.white.opacity(0.5))
                                                    }
                                                    .padding(.horizontal)
                                                    .padding(.top, 10)
                                                    
                                                    Text(image.description)
                                                        .font(.caption)
                                                        .multilineTextAlignment(.leading)
                                                        .kerning(0.06)
                                                        .foregroundColor(.white)
                                                        .frame(width: 280, alignment: .leading)
                                                    
                                                    Spacer()
                                                    
                                                    HStack {
                                                        Text(image.caption)
                                                            .fontWeight(.semibold)
                                                            .font(.system(size: 11))
                                                        //                                                            .font(Font.custom("SF Pro Text", size: 11).weight(.semibold))
                                                            .foregroundColor(Color("darkYellow"))
                                                            .multilineTextAlignment(.center)
                                                            .padding(.horizontal, 10)
                                                            .padding(.vertical, 5)
                                                            .background(
                                                                Rectangle()
                                                                    .foregroundColor(.clear)
                                                                    .background(.white.opacity(0.1))
                                                                    .cornerRadius(10)
                                                            )
                                                        Spacer()
                                                        
                                                        Button(action: {
                                                            // Implement play button action here
                                                        }) {
                                                            ZStack {
                                                                Circle()
                                                                    .foregroundColor(Color.gray)
                                                                    .frame(width: 30, height: 30)
                                                                
                                                                Image(systemName: "play.fill")
                                                                    .foregroundColor(.white)
                                                                    .font(.title3)
                                                            }
                                                        }
                                                    }
                                                    .padding(.horizontal)
                                                    
                                                    
                                                    Spacer()
                                                }
                                            )
                                            .cornerRadius(11)
                                    }
                                    .padding(.horizontal, 0)
                                }
                                .sheet(isPresented: $isPresentSheet, onDismiss:{
                                    if(isPlaying){
                                        buttonPlay = "pause.fill"
                                    }else{
                                        buttonPlay = "play.fill"
                                    }
                                }) {
                                    DetailView(imageData: $selectedStory, audioBrownNoise: $audioBrownNoise, audioNarration: $audioNarration, isPlaying: $isPlaying, currentSec: $currentSec)
                                }
                            }
                            
                        }
                        .padding(.horizontal)
                    }
                    
                    Spacer()
                    
                }
                HStack{
                    if(selectedStory.name != ""){
                        Image(selectedStory.name)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 50, height: 50)
                            .clipped()
                        Text(selectedStory.title)
                            .foregroundColor(Color(red: 0.97, green: 0.9, blue: 0.71))
                        Spacer()
                        Button(action: {
                            if(isPlaying){
                                buttonPlay = "play.fill"
                                isPlaying = false
                                audioBrownNoise.pause()
                                audioNarration.pause()
                            }else{
                                buttonPlay = "pause.fill"
                                isPlaying = true
                                audioBrownNoise.play()
                                audioNarration.play()
                                timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
                                }
                            }
                        }){
                            Image(systemName: buttonPlay).foregroundColor(Color("lightYellow"))
                        }
                    }
                    
                }.padding(.horizontal)
                    .onTapGesture{
                        currentSec = Float((audioBrownNoise?.currentTime)!)
                        print("hehe", currentSec)
                        isPresentSheet.toggle()
                    }
                
                Spacer()
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
            .scrollContentBackground(.hidden)
            .onAppear{
                if(isPlaying){
                    //                    timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
                    //                        print("current time: ", audioBrownNoise.currentTime)
                    //                    }
                }
            }
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
