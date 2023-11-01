//
//  InternetBanner.swift
//  testApp
//
//  Created by Macbook on 31/10/23.
//

import SwiftUI

enum InternetBannerType {
    case error
    case connection
    
    var bannerView: Banner {
        switch self {
        case .error:
            return Banner(title: NetworkError.internetError.errorTitle, text: NetworkError.internetError.errorDescription, systemName: "network.slash", color: Color.red)
        case .connection:
            return Banner(title: "Connection", text: "Your connection is back", systemName: "network", color: Color.green)
        }
    }
}

//struct InternetBanner: View {
//    let error: NetworkError = .internetError
//
//    var body: some View {
//        Banner(title: error.errorTitle, text: error.errorDescription, systemName: "network.slash", color: Color.red)
//    }
//}
//
//struct ConnectionBanner: View {
//    var body: some View {
//        Banner(title: "Connection", text: "Your connection is back", systemName: "network", color: Color.green)
//    }
//}

#Preview {
    VStack {
        InternetBannerType.error.bannerView
        InternetBannerType.connection.bannerView
    }
}
