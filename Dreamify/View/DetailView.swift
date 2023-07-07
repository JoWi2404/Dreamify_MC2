import SwiftUI
import AVKit
import Speech

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(imageData: .constant(ImageData(name: "", title: "", audio: "", description: "", caption: "")), audioBrownNoise: .constant(AVAudioPlayer()), audioNarration: .constant(AVAudioPlayer()), isPlaying: .constant(false), currentSec: .constant(0.0))
            .environmentObject(SpeechRecognizer())
    }
}

struct DetailView: View {
    @EnvironmentObject private var speechRecognizer: SpeechRecognizer
    
    @Binding var imageData: ImageData
    @Binding var audioBrownNoise: AVAudioPlayer!
    @Binding var audioNarration: AVAudioPlayer!
    @Binding var isPlaying: Bool
    @Binding var currentSec: Float
    
    @State private var playbackProgress: Float = 0.5
    @State private var isLiked: Bool = false
    @State var audioDuration: Float = 0.0
    @State var brownDuration: Float = 0.0
    @State var volume = 1.0
    @State var isEditing = false
    @State var isEditingTime = false
    @State var remainingDuration = ""
    @State var currentDuration = ""
    @State var narrationIsPlaying = true
    @State private var timer: Timer? = nil
    @State private var selectedTitle: String = ""
    
    
    var body: some View {
        NavigationStack {
            VStack{
//                Text(speechRecognizer.transcript)
                VStack() {
                    Image(imageData.name)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 350, height: 350)
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                        .padding(.top, 20) // Menambahkan jarak pada bagian atas gambar
                    
                    Spacer()
                    
                    HStack{
                        Text(imageData.title)
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(Color(hex: 0xF7E5B6))
                            .multilineTextAlignment(.leading)
                        Spacer()
                    }.padding(.top, 50)
                    
                    Slider(
                        value: $currentSec,
                        in: 0...brownDuration,
                        //                        step: 0.001,
                        onEditingChanged: { editing in
                            isEditingTime = editing
                            if(!isEditingTime){
                                self.audioNarration.currentTime = TimeInterval(currentSec)
                                self.audioBrownNoise.currentTime = TimeInterval(currentSec)
                                print(currentSec, " ", audioDuration)
                                updateTime()
                                
                                //condition when narration is done (only brown noise is playing, but the user rewind it from the slider)
                                if(!narrationIsPlaying && isPlaying){
                                    if(currentSec < audioDuration){
                                        self.audioNarration.play()
                                        self.audioNarration.currentTime = TimeInterval(currentSec - 15)
                                        narrationIsPlaying = true
                                    }
                                }
                            }
                        }
                    )
                    .accentColor(.white)
                    
                    HStack{
                        Text(currentDuration)
                            .fontWeight(.bold)
                            .foregroundColor(Color(white: 0.5))
                        Spacer()
                        Text(remainingDuration)
                            .fontWeight(.bold)
                            .foregroundColor(Color(white: 0.5))
                    }
                    
                    
                    HStack{
                        //                        Spacer()
                        Button(action:{
                            self.audioNarration.currentTime = TimeInterval(currentSec - 15)
                            self.audioBrownNoise.currentTime = TimeInterval(currentSec - 15)
                            updateTime()
                            
                            //condition when narration is done (only brown noise is
                            //playing, but the user rewind it by 15 secs)
                            if(!narrationIsPlaying && isPlaying){
                                if(currentSec < audioDuration){
                                    self.audioNarration.play()
                                    self.audioNarration.currentTime = TimeInterval(currentSec - 15)
                                    narrationIsPlaying = true
                                }
                                if(currentSec > brownDuration){
                                    print("done")
                                }
                            }
                            
                        }){
                            Image(systemName: "gobackward.15")
                                .resizable()
                                .frame(width: 30, height: 30)
                        }.foregroundColor(Color(hex: 0xF7E5B6))
                        
                        Spacer()
                        
                        if(isPlaying){
                            Button(action: {
                                print("pause")
                                if(narrationIsPlaying){
                                    self.audioNarration.pause()
                                }
                                self.audioBrownNoise.pause()
                                isPlaying = false
                                
                                timer?.invalidate()
                            }) {
                                Image(systemName: "pause.fill").resizable()
                                    .frame(width: 50, height: 50)
                                    .aspectRatio(contentMode: .fit)
                            }.foregroundColor(Color(hex: 0xF7E5B6))
                        }else{
                            Button(action: {
                                print("play")
                                self.audioBrownNoise.play()
                                self.audioNarration.play()
                                isPlaying = true
                                narrationIsPlaying = true
                                
                                //update timer
                                timerCounter()
                            }) {
                                Image(systemName: "play.fill").resizable()
                                    .frame(width: 50, height: 50)
                                    .aspectRatio(contentMode: .fit)
                            }.foregroundColor(Color(hex: 0xF7E5B6))
                        }
                        Spacer()
                        Button(action:{
                            self.audioNarration.currentTime = TimeInterval(currentSec + 30)
                            self.audioBrownNoise.currentTime = TimeInterval(currentSec + 30)
                            updateTime()
                        }){
                            Image(systemName: "goforward.30")
                                .resizable()
                                .frame(width: 30, height: 30)
                        }.foregroundColor(Color(hex: 0xF7E5B6))
                        //                        Spacer()
                    }.padding(.horizontal, 50)
                    
                    Spacer()
                    
                    VStack(spacing: 0){
                        Text("Narrator's Volume")
                            .multilineTextAlignment(.center)
                            .padding(.top)
                            .fontWeight(.bold)
                            .foregroundColor(Color(white: 0.5))
                        
                        Slider(
                            value: $volume,
                            in: 0...1,
                            onEditingChanged: { editing in
                                isEditing = editing
                                if(!isEditing){
                                    self.audioNarration.volume = Float(volume)
                                }
                            }
                        )
                        .padding(0)
                        .accentColor(Color(white: 0.8))
                        
                    }
                    
                    Spacer()
                }
                .onChange(of: speechRecognizer.transcript.lowercased()) { newValue in
                    if newValue.contains("play") {
                        startPlayback()
                    } else if newValue.contains("stop") {
                        if isPlaying {
                            stopPlayback()
                        }
                    }
                    speechRecognizer.transcript = ""
                }
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarHidden(true)
                .padding(15)
                .onAppear {
                    selectedTitle = self.audioBrownNoise?.url?.lastPathComponent ?? ""
                    if selectedTitle != imageData.audio+"_BG.mp3" {
                        let soundBrownNoise = Bundle.main.path(forResource: imageData.audio+"_BG", ofType: "mp3")
                        do{
                            try AVAudioSession.sharedInstance().setCategory(.playAndRecord, mode: .spokenAudio, options: [.defaultToSpeaker, .allowAirPlay, .allowBluetoothA2DP])
//                            try AVAudioSession.sharedInstance().setActive(true)
                        }catch {
                            print("Failed to play audio: \(error)")
                        }
                        self.audioBrownNoise = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: soundBrownNoise!))
                        let soundNarration = Bundle.main.path(forResource: imageData.audio+"_Narator", ofType: "mp3")
                        self.audioNarration = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: soundNarration!))
                    }
                    
                    audioDuration = Float(audioNarration?.duration ?? 0)
                    brownDuration = Float(audioBrownNoise?.duration ?? 0)
                    
//                    let secondAudioMins = Int((audioNarration?.duration ?? 0) - (audioNarration?.currentTime ?? 0)) / 60
//                    let secondAudioSecs = Int((audioNarration?.duration ?? 0) - (audioNarration?.currentTime ?? 0)) % 60
//                    remainingDuration = NSString(format: "%02d:%02d", secondAudioMins, secondAudioSecs) as String
//                    
//                    let firstAudioMins = Int(audioBrownNoise?.currentTime ?? 0) / 60
//                    let firstAudiosecs = Int(audioBrownNoise?.currentTime ?? 0) % 60
//                    currentDuration = NSString(format: "%02d:%02d", firstAudioMins, firstAudiosecs) as String
                    
                    self.audioBrownNoise.play()
                    self.audioNarration.play()
                    isPlaying = true
                    narrationIsPlaying = true
                    timerCounter()
                    speechRecognizer.transcribe()
                    updateTime()
                    //                            startRecording()
                    
                }
            }
            //            .background(Color(red:0.19078, green:0.1647, blue:0.27058))
            
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
    
    func togglePlayback() {
        if isPlaying {
            stopPlayback()
        } else {
            startPlayback()
        }
    }
    
    func updateTime(){
        let duration = Int((audioBrownNoise?.duration ?? 0) - (audioBrownNoise?.currentTime ?? 0))
        let minutes2 = duration/60
        let seconds2 = duration - minutes2 * 60
        remainingDuration = NSString(format: "%02d:%02d", minutes2,seconds2) as String
        //        durationSec = Float((audioNarration?.duration ?? 0) - (audioNarration?.currentTime ?? 0))
        
        
        let currentTime1 = Int((audioBrownNoise?.currentTime)!)
        let minutes = currentTime1/60
        let seconds = currentTime1 - minutes * 60
        currentDuration = NSString(format: "%02d:%02d", minutes,seconds) as String
        currentSec = Float((audioBrownNoise?.currentTime)!)
        //        currentSecDouble = Double((audioNarration?.currentTime)!)
    }
    
    func timerCounter(){
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            updateTime()
            if (currentSec >= audioDuration) {
                narrationIsPlaying = false
                print("end")
            }
        }
    }
    func startPlayback() {
        isPlaying = true
        narrationIsPlaying = true
        audioBrownNoise.play()
        audioNarration.play()
        timerCounter()
    }
    
    func stopPlayback() {
        isPlaying = false
        narrationIsPlaying = false
        audioBrownNoise.pause()
        audioNarration.pause()
        if let timer = timer {
            timer.invalidate()
        }
    }
    
}
