//
//  Album.swift
//  testApp
//
//  Created by Santigo Mendoza on 10/28/23.
//

import Foundation
import RealmSwift

class Album: Object, Codable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var albumId: Int
    @Persisted var url: String
    
    convenience init(albumId: Int, url: String) {
        self.init()
        self.albumId = albumId
        self.url = url
    }
    
    enum CodingKeys: String, CodingKey {
        case url
        case albumId = "id"
    }
}

typealias AlbumsResponse = [Album]
