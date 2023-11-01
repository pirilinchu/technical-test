//
//  ContentView.swift
//  testApp
//
//  Created by Santigo Mendoza on 10/28/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var monitor = NetworkMonitor()
    @State var banner: InternetBannerType?
    
    func showBanner(connected: Bool = false) {
        withAnimation {
            self.banner = connected ? .connection : .error
        }
        Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false) { _ in
            withAnimation {
                self.banner = nil
            }
        }
    }
    
    var body: some View {
        HomeView()
            .overlay {
                if let banner = banner {
                    VStack {
                        banner.bannerView
                        Spacer()
                    }
                }
            }
            .onReceive(NotificationCenter.default.publisher(for: .showInternetBanner), perform: { _ in
                self.showBanner()
            })
            .onReceive(NotificationCenter.default.publisher(for: .showConnectionBanner), perform: { _ in
                self.showBanner(connected: true)
            })
    }
}

#Preview {
    ContentView()
}
