//
//  CoinImageView.swift
//  CryptoApp
//
//  Created by David Cartwright on 2025-01-16.
//

import SwiftUI



struct CoinImageView: View {
    
    @State var vm: CoinImageViewModel
    
    init(coin: CoinModel) {
        self._vm = State(wrappedValue: CoinImageViewModel(coin: coin))
    }
    
    var body: some View {
        ZStack {
            if let image = vm.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
            } else if vm.isLoading {
                ProgressView()
            } else {
                Image(systemName: "questionmark")
                    .foregroundStyle(Color.theme.secondaryText)
            }
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    CoinImageView(coin: DeveloperPreview.shared.coin)
        .padding()
}
