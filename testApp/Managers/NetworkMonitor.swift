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
    
    var isConnected = true
    
    var lastStatus: NWPath.Status = .satisfied
     
    init() {
        monitor.pathUpdateHandler =  { [weak self] path in
            DispatchQueue.main.async {
                self?.isConnected = path.status == .satisfied
                
                switch path.status {
                case .satisfied:
                    if self?.lastStatus == .unsatisfied {
                        NotificationCenter.default.post(name: .showConnectionBanner, object: nil)
                    }
                case .unsatisfied:
                    if self?.lastStatus == .satisfied {
                        NotificationCenter.default.post(name: .showInternetBanner, object: nil)
                    }
                case .requiresConnection:
                    print("TBD")
                @unknown default:
                    print("TBD")
                }
                
                self?.lastStatus = path.status
            }
        }
        monitor.start(queue: queue)
    }
}

extension Notification.Name {
    static let showInternetBanner = Notification.Name("ShowInternetBanner")
    static let showConnectionBanner = Notification.Name("ShowConnectionBanner")
}
