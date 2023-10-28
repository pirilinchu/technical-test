//
//  VideoManager.swift
//  testApp
//
//  Created by Santigo Mendoza on 10/28/23.
//

import Foundation

class VideoManager {
    static let shared = VideoManager()

    // Mocked videos from https://gist.github.com/poudyalanil/ca84582cbeb4fc123a13290a586da925
    let videosURL = [
        "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
        "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
        "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
        "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4"
    ]
    
    var randomVideoURL: String {
        videosURL.randomElement() ?? videosURL[0]
    }
}
