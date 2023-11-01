//
//  MyPost.swift
//  testApp
//
//  Created by Santigo Mendoza on 10/28/23.
//

import Foundation
import RealmSwift

class MyPost: Object, Identifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var post: Post?
    @Persisted var album: Album?
    @Persisted var videoURL: String
    
    var url: URL? {
        URL(string: videoURL)
    }
    
    convenience init(post: Post, album: Album, videoURL: String) {
        self.init()
        self.post = post
        self.album = album
        self.videoURL = videoURL
    }
    
    static func == (lhs: MyPost, rhs: MyPost) -> Bool {
        lhs.id == rhs.id
    }
}
