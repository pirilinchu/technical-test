//
//  HomeView.swift
//  testApp
//
//  Created by Santigo Mendoza on 10/28/23.
//

import SwiftUI

struct HomeView: View {
    let data: [MyPost] = [PreviewData.myPost, PreviewData.myPost]
    
    var body: some View {
        NavigationStack {
            List(data) { data in
                NavigationLink {
                    PostDetailsView(data: data)
                } label: {
                    PostCardView(data: data)
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
