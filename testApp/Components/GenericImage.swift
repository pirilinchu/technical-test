//
//  GenericImage.swift
//  testApp
//
//  Created by Santigo Mendoza on 10/28/23.
//

import SwiftUI

struct GenericImage: View {
    let stringUrl: String
    
    var url: URL? {
        URL(string: stringUrl)
    }
    
    var placeHolderImage: some View {
        Image(systemName: "photo")
            .resizable()
            .foregroundStyle(.gray.opacity(0.3))
    }
    
    var body: some View {
        AsyncImage(url: url) { image in
            image.resizable()
        } placeholder: {
            placeHolderImage
        }
        .scaledToFit()
    }
}

#Preview {
    VStack {
        GenericImage(stringUrl: PreviewData.album.url)
        GenericImage(stringUrl: "")
    }
    .padding(50)
}
