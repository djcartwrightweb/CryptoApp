//
//  CoinModel.swift
//  CryptoApp
//
//  Created by David Cartwright on 2025-01-13.
//

import Foundation

/*
 CoinGecko API info:
 
 URL:
 curl --request GET \
      --url 'https://api.coingecko.com/api/v3/coins/markets?vs_currency=cad&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h' \
      --header 'accept: application/json' \
      --header 'x-cg-demo-api-key: CG-aMwrKUCeve5asE38dwwtpGLq'
 
 
 {
     "id": "bitcoin",
     "symbol": "btc",
     "name": "Bitcoin",
     "image": "https://coin-images.coingecko.com/coins/images/1/large/bitcoin.png?1696501400",
     "current_price": 132518,
     "market_cap": 2621564527765,
     "market_cap_rank": 1,
     "fully_diluted_valuation": 2779112129721,
     "total_volume": 92493916926,
     "high_24h": 138314,
     "low_24h": 129345,
     "price_change_24h": -4782.0761489392025,
     "price_change_percentage_24h": -3.48293,
     "market_cap_change_24h": -98450751245.70557,
     "market_cap_change_percentage_24h": -3.61949,
     "circulating_supply": 19809512,
     "total_supply": 21000000,
     "max_supply": 21000000,
     "ath": 154602,
     "ath_change_percentage": -14.39983,
     "ath_date": "2024-12-17T15:02:41.429Z",
     "atl": 69.81,
     "atl_change_percentage": 189480.35989,
     "atl_date": "2013-07-05T00:00:00.000Z",
     "roi": null,
     "last_updated": "2025-01-13T18:00:02.114Z",
     "sparkline_in_7d": {
       "price": [
         94124.68513319505,
         94466.35491829069,
       ]
     },
     "price_change_percentage_24h_in_currency": -3.482928653639887
   },
 
 */


struct CoinModel: Identifiable, Codable {
    let id, symbol, name: String
    let image: String
    let currentPrice: Double
    let marketCap, marketCapRank, fullyDilutedValuation: Double?
    let totalVolume, high24H, low24H: Double?
    let priceChange24H, priceChangePercentage24H: Double?
    let marketCapChange24H: Double?
    let marketCapChangePercentage24H: Double?
    let circulatingSupply, totalSupply, maxSupply, ath: Double?
    let athChangePercentage: Double?
    let athDate: String?
    let atl, atlChangePercentage: Double?
    let atlDate: String?
    let lastUpdated: String?
    let sparklineIn7D: SparklineIn7D?
    let priceChangePercentage24HInCurrency: Double?
    let currentHoldings: Double?
    
    enum CodingKeys: String, CodingKey {
        case id, symbol, name, image
        case currentPrice = "current_price"
        case marketCap = "market_cap"
        case marketCapRank = "market_cap_rank"
        case fullyDilutedValuation = "fully_diluted_valuation"
        case totalVolume = "total_volume"
        case high24H = "high_24h"
        case low24H = "low_24h"
        case priceChange24H = "price_change_24h"
        case priceChangePercentage24H = "price_change_percentage_24h"
        case marketCapChange24H = "market_cap_change_24h"
        case marketCapChangePercentage24H = "market_cap_change_percentage_24h"
        case circulatingSupply = "circulating_supply"
        case totalSupply = "total_supply"
        case maxSupply = "max_supply"
        case ath
        case athChangePercentage = "ath_change_percentage"
        case athDate = "ath_date"
        case atl
        case atlChangePercentage = "atl_change_percentage"
        case atlDate = "atl_date"
        case lastUpdated = "last_updated"
        case sparklineIn7D = "sparkline_in_7d"
        case priceChangePercentage24HInCurrency = "price_change_percentage_24h_in_currency"
        case currentHoldings
    }
    
    func updateHoldings(amount: Double) -> CoinModel {
        CoinModel(id: id, symbol: symbol, name: name, image: image, currentPrice: currentPrice, marketCap: marketCap, marketCapRank: marketCapRank, fullyDilutedValuation: fullyDilutedValuation, totalVolume: totalVolume, high24H: high24H, low24H: low24H, priceChange24H: priceChange24H, priceChangePercentage24H: priceChangePercentage24H, marketCapChange24H: marketCapChange24H, marketCapChangePercentage24H: marketCapChangePercentage24H, circulatingSupply: circulatingSupply, totalSupply: totalSupply, maxSupply: maxSupply, ath: ath, athChangePercentage: athChangePercentage, athDate: athDate, atl: atl, atlChangePercentage: atlChangePercentage, atlDate: atlDate, lastUpdated: lastUpdated, sparklineIn7D: sparklineIn7D, priceChangePercentage24HInCurrency: priceChangePercentage24HInCurrency, currentHoldings: amount)
    }
    
    var currentHoldingsValue: Double {
        return (currentHoldings ?? 0) * currentPrice
    }
    
    var rank: Int {
        return Int(marketCapRank ?? 0)
    }
    
}

struct SparklineIn7D: Codable {
    let price: [Double]?
}
