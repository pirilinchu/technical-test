//
//  InternetBanner.swift
//  testApp
//
//  Created by Macbook on 28/10/23.
//

import SwiftUI

struct InternetBanner: View {
    let error: NetworkError = .internetError
    
    var body: some View {
        HStack {
            Image(systemName: "network.slash")
                .font(.system(size: 30))
            
            VStack(alignment: .leading) {
                Text(error.errorTitle)
                    .font(.body)
                Text(error.errorDescription ?? "")
                    .font(.subheadline)
                    .multilineTextAlignment(.leading)
            }
            Spacer()
        }
        .foregroundStyle(.white)
        .frame(maxWidth: .infinity, alignment: .center)
        .padding(10)
        .background(Color.red)
        .cornerRadius(10)
        .padding(20)
        .padding(.top, 50)
        .transition(AnyTransition.move(edge: .top).combined(with: .opacity))
        .edgesIgnoringSafeArea(.top)
    }
}

struct InternetBannerOverlay: View {
    var body: some View {
        VStack {
            InternetBanner()
            Spacer()
        }
    }
}

#Preview {
    InternetBannerOverlay()
}
