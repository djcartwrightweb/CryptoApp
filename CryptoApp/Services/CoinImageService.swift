//
//  CoinImageService.swift
//  CryptoApp
//
//  Created by David Cartwright on 2025-01-16.
//

import Foundation
import SwiftUI
import Combine

class CoinImageService {
    
    @Published var image: UIImage?
    
    private var imageSubscription: AnyCancellable?
    private let coin: CoinModel
    private let fileManager = LocalFileManager.shared
    
    init(coin: CoinModel) {
        self.coin = coin
        
    }
    
    private func getCoinImage() {
        if let savedImage = fileManager.getImage(imageName: coin.id, folderName: "coin_images") {
            image = savedImage
            print("retreived image from File Manager")
        } else {
            downloadCoinImage()
            print("Downloading image \(coin.name) now")
        }
    }
    
    private func downloadCoinImage() {
        guard let url = URL(string: coin.image) else { return }
        
        imageSubscription = NetworkingManager.download(url: url)
            .tryMap({ (data) -> UIImage? in
                UIImage(data: data)
            })
            .sink(
                receiveCompletion: NetworkingManager.handleCompletion,
                receiveValue: { [weak self] (returnedImage) in
                    self?.image = returnedImage
                    self?.imageSubscription?.cancel()
                    self?.fileManager.saveImage(image: <#T##UIImage#>, imageName: <#T##String#>, folderName: <#T##String#>)
            })
    }
}
