//
//  PostManager.swift
//  testApp
//
//  Created by Macbook on 28/10/23.
//

import Foundation

class PostManager {
    static let shared = PostManager()
    
    let api = ApiManager.shared
    
    func getPosts() async throws -> [MyPost] {
        async let posts = api.getPosts()
        async let albums = api.getAlbums()
        let data = try await(posts, albums)
        return createPosts(from: data.0, with: data.1)
    }
    
    func createPosts(from posts: [Post], with albums: [Album]) -> [MyPost] {
        var myPosts: [MyPost] = []
        for index in 0..<posts.count {
            myPosts.append(MyPost(post: posts[index], album: albums[index], videoURL: VideoManager.shared.randomVideoURL))
        }
        return myPosts
    }
}
