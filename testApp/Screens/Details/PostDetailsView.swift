//
//  PostDetailsView.swift
//  testApp
//
//  Created by Santigo Mendoza on 10/28/23.
//

import SwiftUI
import AVKit

struct PostDetailsView: View {
    let data: MyPost
    
    let player: AVPlayer?
    
    init(data: MyPost) {
        self.data = data
        if let url = data.url {
            self.player = AVPlayer(url: url)
        } else {
            self.player = nil
        }
        self.player?.play()
    }
    
    var body: some View {
        ScrollView {
            VStack {
                Text(data.post.body)
                    .font(.title3)
                    .bold()
                    .multilineTextAlignment(.leading)
                GenericImage(stringUrl: data.album.url)
                    .frame(height: 200)
                Text(data.post.body)
                    .font(.body)
                    .multilineTextAlignment(.leading)
                    .padding()
                VideoPlayer(player: player)
                    .frame(height: 300)
            }
            .padding()
        }
        .onDisappear {
            player?.pause()
            player?.replaceCurrentItem(with: nil)
        }
    }
}

#Preview {
    PostDetailsView(data: PreviewData.myPost)
}
