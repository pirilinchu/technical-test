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
                GenericImage(stringUrl: data.album.url)
                    .frame(height: 200)
                VStack(alignment: .leading) {
                    Text(data.post.body)
                        .font(.body)
                        .multilineTextAlignment(.leading)
                }
                .padding()
                VideoPlayer(player: player)
                    .frame(height: 300)
            }
            .padding(.horizontal)
            .navigationTitle(data.post.title)
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

#Preview {
    PostDetailsView(data: PreviewData.myPost)
}
