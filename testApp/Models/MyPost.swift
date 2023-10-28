//
//  MyPost.swift
//  testApp
//
//  Created by Santigo Mendoza on 10/28/23.
//

import Foundation

class MyPost: Identifiable, Equatable {
    let id = UUID()
    let post: Post
    let album: Album
    let videoURL: String
    
    var url: URL? {
        URL(string: videoURL)
    }
    
    init(post: Post, album: Album, videoURL: String) {
        self.post = post
        self.album = album
        self.videoURL = videoURL
    }
    
    static func == (lhs: MyPost, rhs: MyPost) -> Bool {
        lhs.id == rhs.id
    }
}
