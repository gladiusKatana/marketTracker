//  APIService.swift
//  CandleTap
//  Created by Garth Snyder on 2018-11-17.      //  Copyright © 2018 Garth Snyder. All rights reserved.
import UIKit

extension NSObject {
    @objc func getFeeds() {                                         print("\nGetting feeds")
        ApiService.sharedInstance.getKrakenFeed { (ohlcChunks) in   // "closure api calls"
            krakenOHLCChunks = ohlcChunks
        }
        
//        ApiService.sharedInstance.getQuadrigaFeed { (ohlcChunks) in
//            quadrigaOHLCChunks = ohlcChunks
//        }
        
        getBinanceCandles(urlString: "https://www.binance.com/api/v1/klines?symbol=ETHBTC&interval=1h")//-------------------------------------------
    }
}

class ApiService: NSObject {
    static let sharedInstance = ApiService()
    let baseUrl = "https://api.kraken.com/0/public/OHLC?pair="      //ie  https://api.kraken.com/0/public/OHLC?pair=XXBTZCAD&since=0
    
    func getKrakenFeed(_ completion: @escaping ([KrakenOHLCChunk]) -> ()) {       // need these wrapper functions fetchFeed(N)...
        fetchKrakenFeedForUrlString(urlString: "\(baseUrl)\(krakenPair)&since=0", completion: completion)//...bc. called as a closure
    }
    
//    func getQuadrigaFeed(_ completion: @escaping ([QuadrigaOHLCChunk]) -> ()) {
//        fetchQuadrigaFeedForUrlString(urlString: "https://api.quadrigacx.com/v2/ticker?book=btc_cad", completion: completion)
//    }
}

func checkExchangesReloaded() {
    let sumTest = exchangesReloaded.reduce(0, +)
    if sumTest == exchangesReloaded.count {
        tradePanelVC.unlockAndReloadTable()
        resetExchangesReloaded()                    //; print("exchanges reloaded now is: \(exchangesReloaded)")
    }
}

func resetExchangesReloaded() {
    let size = exchangesReloaded.count
    exchangesReloaded = []
    for _ in (1...size) {
        exchangesReloaded.append(0)
    }
}


/*func getBinanceFeed(_ completion: @escaping ([BinanceChunk]) -> ()) {
 ///let tmsmp = Date().toSeconds()
 let url = "https://www.binance.com/api/v1/klines?symbol=LTCBTC&interval=1m"
 fetchBinanceFeedForUrlString(urlString: url, completion: completion)
 //works
 //https://www.binance.com/api/v1/klines?symbol=LTCBTC&interval=1m
 //https://www.binance.com/api/v3/ticker/price?symbol=LTCBTC
 //https://api.binance.com/api/v1/ticker/24hr
 }*/
