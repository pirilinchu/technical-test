//
//  Post.swift
//  testApp
//
//  Created by Santigo Mendoza on 10/28/23.
//

import Foundation

// MARK: - Post
class Post: Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
    
    init(userId: Int, id: Int, title: String, body: String) {
        self.userId = userId
        self.id = id
        self.title = title
        self.body = body
    }
}

typealias PostsResponse = [Post]
