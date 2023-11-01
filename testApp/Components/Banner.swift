//
//  Banner.swift
//  testApp
//
//  Created by Macbook on 28/10/23.
//

import SwiftUI

struct Banner: View {
    let title: String
    let text: String?
    let systemName: String
    let color: Color
    
    var body: some View {
        HStack {
            Image(systemName: systemName)
                .font(.system(size: 30))
            
            VStack(alignment: .leading) {
                Text(title)
                    .font(.body)
                Text(text ?? "")
                    .font(.subheadline)
                    .multilineTextAlignment(.leading)
            }
            Spacer()
        }
        .foregroundStyle(.white)
        .frame(maxWidth: .infinity, alignment: .center)
        .padding(10)
        .background(color)
        .cornerRadius(10)
        .padding(20)
        .padding(.top, 50)
        .transition(AnyTransition.move(edge: .top).combined(with: .opacity))
        .edgesIgnoringSafeArea(.top)
    }
}

#Preview {
    Banner(title: "Title", text: "Body", systemName: "network.slash", color: Color.red)
}
