//
//  PostCardView.swift
//  testApp
//
//  Created by Santigo Mendoza on 10/28/23.
//

import SwiftUI

struct PostCardView: View {
    let data: MyPost
    
    var body: some View {
        HStack(spacing: 0) {
            GenericImage(stringUrl: data.album?.url)
                .frame(width: UIScreen.main.bounds.width * 0.3)
            VStack(alignment: .leading) {
                Text(data.post?.title ?? "Default title")
                    .font(.title3)
                    .lineLimit(1)
                    .bold()
                if let body = data.post?.body {
                    Text(body)
                        .font(.body)
                        .multilineTextAlignment(.leading)
                        .lineLimit(4)
                }
            }
            .padding()
        }
        .padding(.horizontal)
    }
}

// Colors added to see clearly the padding
#Preview {
    VStack(spacing: 0) {
        PostCardView(data: PreviewData.myPost)
            .background(Color.red)
        PostCardView(data: PreviewData.myPost)
        PostCardView(data: PreviewData.myPost)
            .background(Color.blue)
    }
}
