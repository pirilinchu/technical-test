//
//  PostManager.swift
//  testApp
//
//  Created by Macbook on 28/10/23.
//

import Foundation

class PostManager {
    static let shared = PostManager()
    
    var api = ApiManager.shared
    var db = DBManager.shared
    
    func getPosts() async throws -> [MyPost] {
        async let posts = api.getPosts()
        async let albums = api.getAlbums()
        do {
            let data = try await(posts, albums)
            let customPosts = createPosts(from: data.0, with: data.1)
            DispatchQueue.main.async {
                self.db.savePosts(posts: customPosts)
            }
            return customPosts
        } catch {
            guard error.isInternetError else {
                throw error
            }
            return db.posts
        }
    }
    
    func createPosts(from posts: [Post], with albums: [Album]) -> [MyPost] {
        var myPosts: [MyPost] = []
        for index in 0..<posts.count {
            myPosts.append(MyPost(post: posts[index], album: albums[index], videoURL: VideoManager.shared.randomVideoURL))
        }
        return myPosts
    }
}
