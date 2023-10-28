//
//  ContentView.swift
//  testApp
//
//  Created by Santigo Mendoza on 10/28/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var monitor = NetworkMonitor()
    @State var isBannerShowing = false
    
    func showInternetBanner() {
        withAnimation {
            self.isBannerShowing = true
        }
        Timer.scheduledTimer(withTimeInterval: 3.0, repeats: false) { _ in
            withAnimation {
                self.isBannerShowing = false
            }
        }
    }
    
    var body: some View {
        HomeView()
            .overlay {
                if isBannerShowing {
                    InternetBannerOverlay()
                }
            }
            .onReceive(NotificationCenter.default.publisher(for: .showInternetBanner), perform: { _ in
                self.showInternetBanner()
            })
    }
}

#Preview {
    ContentView()
}
