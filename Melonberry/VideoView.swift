//
//  VideoView.swift
//  Melonberry
//
//  Created by Václav Matoušek on 17.12.2021.
//

import SwiftUI
import AVKit
import youtube_ios_player_helper
import YoutubePlayer_in_WKWebView

struct YTWrapper : UIViewRepresentable {
    func updateUIView(_ uiView: WKYTPlayerView, context: Context) {
        //
    }
    
    var videoID: String
    
    func makeUIView(context: Context) -> WKYTPlayerView {
        let playerView = WKYTPlayerView()
        playerView.load(withVideoId: videoID)
        return playerView
    }
}

struct VideoView: View {
    var tsurl: String
    
    var body: some View {
        
        YTWrapper(videoID: String(tsurl.suffix(11)))
        
//        let playerView = YTPlayerView()
//        playerView.load(withVideoId: String(tsurl.suffix(11)))
        
//        let player = AVPlayer(url: URL(string: tsurl)!)
//        VideoPlayer(player: player)
//            .onAppear {
//                player.play()
//            }
   }
}

struct VideoView_Previews: PreviewProvider {
    static var previews: some View {
        VideoView(tsurl: "")
    }
}
