//
//  ViewExtensions.swift
//  testApp
//
//  Created by Macbook on 28/10/23.
//

import SwiftUI

extension View {
    
    private var keyWindow: UIWindow? {
        UIApplication.shared.windows.filter {$0.isKeyWindow}.first
    }
    
    func okWarningAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { _ in
            alert.dismiss(animated: true)
        }))
        
        if var topController = keyWindow?.rootViewController {
            while let presentedViewController = topController.presentedViewController {
                topController = presentedViewController
            }
            topController.present(alert, animated: true, completion: nil)
        }
    }
    
    func showError(error: NetworkError) {
        okWarningAlert(title: error.errorTitle, message: error.errorDescription ?? "")
    }
    
    func showInternetError() {
        showError(error: .internetError)
    }
}
