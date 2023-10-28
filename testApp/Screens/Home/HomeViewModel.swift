//
//  HomeViewModel.swift
//  testApp
//
//  Created by Macbook on 28/10/23.
//

import Foundation

enum ViewState {
    case loading
    case success
    case error(NetworkError)
}

class HomeViewModel: ObservableObject {
    @Published var data: [MyPost] = []
    @Published var selectedPost: MyPost?
    @Published var state: ViewState = .loading
    
    func loadData() async {
        state = .loading
        do {
            data = try await PostManager.shared.getPosts()
            state = .success
        } catch {
            guard let error = error as? NetworkError else {
                state = .error(.unknownError)
                return
            }
            state = .error(error)
        }
    }
    
    func onPostTapped(_ post: MyPost) {
        selectedPost = post
    }
}
