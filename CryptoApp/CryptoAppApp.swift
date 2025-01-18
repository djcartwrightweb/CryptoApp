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
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor(Color.theme.accent)]
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor(Color.theme.accent)]
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                HomeView()
                    .toolbar(.hidden)
                    .preferredColorScheme(.dark)
            }
            .environmentObject(homeVm)
        }
    }
}
