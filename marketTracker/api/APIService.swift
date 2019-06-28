//  APIService.swift
//  CandleTap
//  Created by Garth Snyder on 2018-11-17.      //  Copyright © 2018 Garth Snyder. All rights reserved.
import UIKit

extension NSObject {
    @objc func getFeeds() {                                         print("\nGetting feeds")
        getBinanceCandles(urlString: "https://www.binance.com/api/v1/klines?symbol=ETHBTC&interval=1h")
        
        ApiService.sharedInstance.getKrakenFeed { (ohlcChunks) in       // closure api calls
            krakenOHLCChunks = ohlcChunks
//            print("...kraken chunks' last timestamp: \(String(describing: krakenOHLCChunks?.last!.result!.last))")
        }
        
        ApiService.sharedInstance.getShakepayFeed { (ohlcChunks) in
            shakepayPriceUpdates = ohlcChunks
            print("\nbtc:cad price from the shakepay api: \(String(describing: shakepayPriceUpdates?.last!.BTC_CAD))\n")
        }
        
        
        //getShakepayCandle(urlString: "https://api.shakepay.co/rates")
    }
}

class ApiService: NSObject {
    static let sharedInstance = ApiService()
    let baseUrl = "https://api.kraken.com/0/public/OHLC?pair="      //ie  https://api.kraken.com/0/public/OHLC?pair=XXBTZCAD&since=0
    
    func getKrakenFeed(_ completion: @escaping ([KrakenOHLCChunk]) -> ()) {       // need these wrapper functions fetchFeed(N)...
        fetchKrakenFeedForUrlString(urlString: "\(baseUrl)\(krakenPair)&since=0", completion: completion)//...bc. called as a closure
    }
    
    func getShakepayFeed(_ completion: @escaping ([ShakepayPriceUpdate]) -> ()) {       // need these wrapper functions fetchFeed(N)...
        fetchShakepayFeedForUrlString(urlString: "https://api.shakepay.co/rates", completion: completion)//...bc. called as a closure
    }
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
