//
//  HomeView.swift
//  testApp
//
//  Created by Santigo Mendoza on 10/28/23.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {
        VStack {
            switch viewModel.state {
            case .loading:
                Spacer()
                ProgressView()
            case .success:
                List(viewModel.data) { post in
                    PostCardView(data: post)
                        .onTapGesture {
                            guard NetworkMonitor.shared.isNetworkReachable else {
                                self.showInternetError()
                                return
                            }
                            viewModel.onPostTapped(post)
                        }
                }
            case .error(let networkError):
                Spacer()
                self.errorView(error: networkError) {
                    Task {
                        await viewModel.loadData()
                    }
                }
            }
            Spacer()
        }
        .sheet(item: $viewModel.selectedPost, content: { post in
            PostDetailsView(data: post)
        })
        .task {
            await viewModel.loadData()
        }
        .ignoresSafeArea(edges: .bottom)
    }
}

#Preview {
    HomeView()
}
