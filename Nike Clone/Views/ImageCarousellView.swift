//
//  ImageCarousellView.swift
//  Nike Clone
//
//  Created by Shawn Law on 22/12/2024.
//

import SwiftUI
import AVKit

struct ImageCarousellView: View {
    
    let shoe: Shoe
    
    var body: some View {
        TabView {
            ForEach(shoe.images, id: \.self) { image in
                Image(image)
                    .resizable()
                    .scaledToFill()
            }
            
            if shoe.video != nil {
                VideoPlayerView(videoName: "airJordan11RetroVideo")
            }
        }
        .tabViewStyle(.page)
        .frame(width: UIScreen.screenWidth, height: 480)
    }
}



struct VideoPlayerView: View {
    let videoName: String
    
    @State private var player: AVPlayer? = nil
    
    var body: some View {
        if let url = Bundle.main.url(forResource: videoName, withExtension: "mp4") {
            VideoPlayer(player: player)
                .onAppear {
                    if player == nil {
                        player = AVPlayer(url: url)
                    }
                    player?.play()
                }
                .onDisappear {
                    player?.pause()
                }
        }
    }
}


#Preview {
    ImageCarousellView(shoe: mockShoe)
}
