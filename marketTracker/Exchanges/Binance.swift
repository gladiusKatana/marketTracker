//  Binance.swift
//  CandleTap
//  Created by Garth Snyder on 2018-11-17.      //  Copyright © 2018 Garth Snyder. All rights reserved.
import UIKit;   import Foundation

func getBinanceCandles(urlString: String) {                             print("fetching binance")
    guard let url = URL(string: urlString) else {
        print("error with url")
        return
    }                                                                   //; print("ok the url is \(url)")
    
    URLSession.shared.dataTask(with: url) { (data, response, err) in
        
        guard let data = data else {return}                             //; print("ok, the data is \(data)")
        
        do {
            guard let json = try JSONSerialization.jsonObject(with: data, options: []) as? [[AnyObject]] else {
                print("error binding binance json data (without keys) to array of arrays")
                return
            }                                                           //print("ok, the json response is \(json)")
            
            binanceCandles = json                                       //; print("binance http response is:... ") //\(binanceCandles!)
            binanceCandleSub = binanceCandles!
            binanceCandleSub.removeFirst(400)
            //for arr in binanceCandles! {print("-\(arr)\n")}           //print(binanceCandles)
            
        } catch let error {                                             // as Error { //or as NSError
            print("Failed to load: \(error.localizedDescription)")
        }
        
        DispatchQueue.main.async {  print("binding data from [insert exchange name] api")
            exchangesReloaded[2] = 1
            checkExchangesReloaded()
        }
        }
        .resume()
}


/*class BinanceChunk: SafeJsonObject {
 //    @objc var
 }*/

//func fetchBinanceFeedForUrlString(urlString: String, completion: @escaping ([BinanceChunk]) -> ()) { print("fetching binance")
//    guard let url = URL(string: urlString) else { print("error binding binance url")
//        return}
//
//    URLSession.shared.dataTask(with: url as URL) { (data, response, error) in
//        guard let data = data else { print("error binding binance  data  parameter in URLSession")
//            return}
//        do {
//            guard let jsonDictionaries = try [JSONSerialization.jsonObject(with: data, options: .mutableContainers)] as? [[String]] else { print("error binding binance json-dictionaries to array of arrays (Binance API OHLC format)")
//                return}
//
//            completion(
//                jsonDictionaries.map({
//                    return BinanceChunk(dictionary: $0)})
//            )
//        } catch let jsonSerializationError {
//            print("Error serializing json:", jsonSerializationError)
//        }
//
//        DispatchQueue.main.async {                                                //print("binding data from binance api")
//            exchangesReloaded[2] = 1
//            checkExchangesReloaded()
//        }
//        }
//        .resume()
//}

