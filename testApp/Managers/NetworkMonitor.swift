//
//  NetworkMonitor.swift
//  testApp
//
//  Created by Macbook on 28/10/23.
//
//
//  From https://www.danijelavrzan.com/posts/2022/11/network-connection-alert-swiftui/

import SwiftUI
import Network
 
final class NetworkMonitor: ObservableObject {
    let monitor = NWPathMonitor()
    let queue = DispatchQueue(label: "Monitor")
    
    static let shared = NetworkMonitor()
    
    var isNetworkReachable: Bool {
        isConnected
    }
     
    @Published var isConnected = true
     
    init() {
        monitor.pathUpdateHandler =  { [weak self] path in
            DispatchQueue.main.async {
                withAnimation {
                    self?.isConnected = path.status == .satisfied ? true : false
                }
            }
        }
        monitor.start(queue: queue)
    }
}
