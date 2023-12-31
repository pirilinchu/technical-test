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
    
    var body: some View {
        ScrollView {
            VStack {
                Text(data.post?.title ?? "")
                    .font(.title3)
                    .bold()
                    .multilineTextAlignment(.leading)
                    .accessibilityIdentifier(String(data.post?.postId ?? -1))
                GenericImage(stringUrl: data.album?.url)
                    .frame(height: 200)
                Text(data.post?.body ?? "")
                    .font(.body)
                    .multilineTextAlignment(.leading)
                if let url = data.url {
                    VideoPlayer(player: AVPlayer(url: url))
                        .frame(height: 300)
                }
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    PostDetailsView(data: PreviewData.myPost)
}
