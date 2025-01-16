//
//  HomeViewModel.swift
//  CryptoApp
//
//  Created by David Cartwright on 2025-01-13.
//

import Foundation
import Combine

@Observable class HomeViewModel {
    var allCoins: [CoinModel] = []
    var portfolioCoins: [CoinModel] = []
    
    var searchText: String = ""
    
    private let dataService = CoinDataService()
    private var cancellables = Set<AnyCancellable>()
    
    
    init() {
        addSubscribers()
    }
    
    func addSubscribers() {
        dataService.$allCoins //links to the published allCoins in CoinDataService.swift
            .sink { [weak self] returnedCoins in
                self?.allCoins = returnedCoins
            }
            .store(in: &cancellables)
    }
}
