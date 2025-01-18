//
//  CryptoAppApp.swift
//  CryptoApp
//
//  Created by David Cartwright on 2025-01-13.
//

import SwiftUI

@main
struct CryptoAppApp: App {
    
    @StateObject private var homeVm = HomeViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                HomeView()
                    .toolbar(.hidden)
            }
            .environmentObject(homeVm)
        }
    }
}
