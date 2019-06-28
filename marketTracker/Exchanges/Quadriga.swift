//  Quadriga.swift
//  CandleTap
//  Created by Garth Snyder on 2018-11-17.      //  Copyright © 2018 Garth Snyder. All rights reserved.
import UIKit

//class QuadrigaOHLCChunk: SafeJsonObject {
//    @objc var high: AnyObject?
//    @objc var last: AnyObject?
//    @objc var timestamp: AnyObject?
//    @objc var volume: AnyObject?
//    @objc var vwap: AnyObject?
//    @objc var low: AnyObject?
//    @objc var ask: AnyObject?
//    @objc var bid: AnyObject?
//
//    init(dictionary: [String: AnyObject]) {
//        super.init()
//        setValuesForKeys(dictionary)
//    }
//}

//func fetchQuadrigaFeedForUrlString(urlString: String, completion: @escaping ([QuadrigaOHLCChunk]) -> ()) { print("fetching quadriga")
//    guard let url = URL(string: urlString) else { print("error binding quadriga url")
//        return}
//    
//    URLSession.shared.dataTask(with: url as URL) { (data, response, error) in
//        guard let data = data else { print("error binding quadriga  data  parameter in URLSession")
//            return}
//        do {
//            guard let jsonDictionaries = try [JSONSerialization.jsonObject(with: data, options: .mutableContainers)] as? [[String: AnyObject]] else { print("error binding quadriga json-dictionaries to array of arrays (Quadriga API OHLC format)")
//                return}
//            
//            completion(
//                jsonDictionaries.map({
//                    return QuadrigaOHLCChunk(dictionary: $0)})
//            )
//        } catch let jsonSerializationError {
//            print("Error serializing json:", jsonSerializationError)
//        }
//        
//        DispatchQueue.main.async {                                                //print("binding data from quadriga api")
//            exchangesReloaded[1] = 1
//            checkExchangesReloaded()
//        }
//        }
//        .resume()
//}


