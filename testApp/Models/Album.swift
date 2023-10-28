//
//  Album.swift
//  testApp
//
//  Created by Santigo Mendoza on 10/28/23.
//

import Foundation

class Album: Codable {
    let albumId: Int
    let url: String
    
    init(albumId: Int, url: String) {
        self.albumId = albumId
        self.url = url
    }
}
