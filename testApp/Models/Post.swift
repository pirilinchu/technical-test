//
//  Post.swift
//  testApp
//
//  Created by Santigo Mendoza on 10/28/23.
//

import Foundation
import RealmSwift

// MARK: - Post
class Post: Object, Codable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var userId: Int
    @Persisted var postId: Int
    @Persisted var title: String
    @Persisted var body: String
    
    convenience init(userId: Int, id: Int, title: String, body: String) {
        self.init()
        
        self.userId = userId
        self.postId = id
        self.title = title
        self.body = body
    }
    
    enum CodingKeys: String, CodingKey {
        case userId, title, body
        case postId = "id"
    }
}

typealias PostsResponse = [Post]
