//
//  TestMocks.swift
//  testAppTests
//
//  Created by Macbook on 31/10/23.
//

import Foundation
@testable import testApp

class MockApiManager: ApiManager {
    var throwError: Bool = false
    var throwInternetError: Bool = false
    
    override func getPosts() async throws -> [Post] {
        guard !throwError else {
            throw NetworkError.unknownError
        }
        
        guard !throwInternetError else {
            throw NetworkError.internetError
        }
        
        return [Post(userId: 0, id: 0, title: "Post 0", body: "Body 0"), Post(userId: 1, id: 1, title: "Post 1", body: "Body 1")]
    }
    
    override func getAlbums() async throws -> [Album] {
        return [Album(albumId: 0, url: "url0"), Album(albumId: 1, url: "url1")]
    }
}

class MockDBManager: DBManager {
    var savedPosts: [MyPost] = []
    
    override func savePosts(posts: [MyPost]) {
        savedPosts = posts
    }
    
    override var posts: [MyPost] {
        savedPosts
    }
}
