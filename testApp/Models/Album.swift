//
//  Album.swift
//  testApp
//
//  Created by Santigo Mendoza on 10/28/23.
//

import Foundation

class Album: Codable {
    let id: Int
    let url: String
    
    init(albumId: Int, url: String) {
        self.id = albumId
        self.url = url
    }
}

typealias AlbumsResponse = [Album]
