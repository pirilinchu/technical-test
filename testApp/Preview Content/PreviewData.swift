//
//  PreviewData.swift
//  testApp
//
//  Created by Santigo Mendoza on 10/28/23.
//

import Foundation

class PreviewData {
    static var post: Post {
        Post(userId: 1, id: 1, title: "Lorem ipsum", body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.")
    }
    
    static var album: Album {
        Album(albumId: 1, url: "https://via.placeholder.com/600/92c952")
    }
    
    static var myPost: MyPost {
        MyPost(post: post, album: album, videoURL: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp")
    }
}
