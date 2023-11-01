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
    @Published var data: [MyPost]
    @Published var selectedPost: MyPost?
    @Published var state: ViewState
    
    init() {
        self.data = []
        self.state = .loading
    }
    
    func loadData() async {
        state = .loading
        do {
            data = try await PostManager.shared.getPosts()
            state = .success
        } catch {
            state = .error(error.networkError)
        }
    }
    
    func onPostTapped(_ post: MyPost) {
        selectedPost = post
    }
}
