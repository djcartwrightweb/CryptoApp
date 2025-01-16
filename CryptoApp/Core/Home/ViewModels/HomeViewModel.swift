//
//  HomeViewModel.swift
//  CryptoApp
//
//  Created by David Cartwright on 2025-01-13.
//

import Foundation

@Observable class HomeViewModel {
    var allCoins: [CoinModel] = []
    var portfolioCoins: [CoinModel] = []
    
    init() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.allCoins.append(DeveloperPreview.shared.coin)
            self.portfolioCoins.append(DeveloperPreview.shared.coin)
        }
    }
    
    func downloadData() {
    }
}
