//
//  HomeView.swift
//  testApp
//
//  Created by Santigo Mendoza on 10/28/23.
//

import SwiftUI

struct HomeView: View {
    @State var data: [MyPost] = []
    @State var selectedPost: MyPost?
        
    var body: some View {
        List(data) { post in
            PostCardView(data: post)
                .onTapGesture {
                    selectedPost = post
                }
        }
        .sheet(item: $selectedPost, content: { post in
            PostDetailsView(data: post)
        })
        .task {
            do {
                data = try await PostManager.shared.getPosts()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}

#Preview {
    HomeView()
}
