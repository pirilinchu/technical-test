//
//  ApiManager.swift
//  testApp
//
//  Created by Macbook on 28/10/23.
//

import Foundation

class ApiManager {
    static let shared = ApiManager()
    
    func getPosts() async throws -> [Post] {
        guard NetworkMonitor.shared.isConnected else {
            throw NetworkError.internetError
        }
        
        guard let url = Endpoint.posts.url else {
            throw NetworkError.unknownError
        }
        
        let request = URLRequest(url: url)
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            guard (response as? HTTPURLResponse)?.statusCode == 200 else {
                throw NetworkError.unknownError
            }
            let decodedResponse = try JSONDecoder().decode(PostsResponse.self, from: data)
            return decodedResponse
        } catch {
            throw NetworkError.error(error: error)
        }
    }
    
    func getAlbums() async throws -> [Album] {
        guard NetworkMonitor.shared.isConnected else {
            throw NetworkError.internetError
        }
        
        guard let url = Endpoint.albums.url else {
            throw NetworkError.unknownError
        }
        
        let request = URLRequest(url: url)
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            guard (response as? HTTPURLResponse)?.statusCode == 200 else {
                throw NetworkError.unknownError
            }
            let decodedResponse = try JSONDecoder().decode(AlbumsResponse.self, from: data)
            return decodedResponse
        } catch {
            throw NetworkError.error(error: error)
        }
    }
}

enum NetworkError: LocalizedError {
    case unknownError
    case internetError
    case error(error: Error)
    
    var errorDescription: String? {
        switch self {
        case .unknownError:
            "Something went wrong"
        case .internetError:
            "You do not have internet access"
        case .error(let error):
            error.localizedDescription
        }
    }
    
    var errorTitle: String {
        switch self {
        case .unknownError:
            "Error"
        case .internetError:
            "No Internet"
        case .error:
            "Server Error"
        }
    }
}

enum Endpoint {
    case posts
    case albums
    
    var url: URL? {
        return switch self {
        case .posts:
            URL(string: "https://jsonplaceholder.typicode.com/posts")
        case .albums:
            URL(string: "https://jsonplaceholder.typicode.com/photos")
        }
    }
}
