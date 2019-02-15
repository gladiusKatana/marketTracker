//  Kraken.swift
//  CandleTap
//  Created by Garth Snyder on 2018-11-17.      //  Copyright © 2018 Garth Snyder. All rights reserved.
import UIKit

class KrakenOHLCChunk: SafeJsonObject {
    @objc var error: [Any]?
    @objc var result: TradingPair?
    
    @objc override func setValue(_ value: Any?, forKey key: String) {
        guard key == "result" else {                    // custom result setup *
            super.setValue(value, forKey: key); return
        }
        result = TradingPair()
        result?.setValuesForKeys(value as! [String: AnyObject])
    }
    
    init(dictionary: [String: AnyObject]) {
        super.init()
        setValuesForKeys(dictionary)
    }
}

class TradingPair: SafeJsonObject {
    @objc var XXBTZEUR: [[AnyObject]]? // these AnyObject?  or  [[AnyObject]]?  properties below could also be  AnyObject  or  Any
    @objc var XXBTZCAD: [[AnyObject]]?
    @objc var XXBTZUSD: [[AnyObject]]?
    // @objc var XETHZXBT: [[AnyObject]]? //...  // @objc var XXETHBTZ: [[AnyObject]]?
    @objc var last: AnyObject?            // if Date, it crashes... will have to convert to formatted date
}

func fetchKrakenFeedForUrlString(urlString: String, completion: @escaping ([KrakenOHLCChunk]) -> ()) { print("fetching kraken")
    guard let url = URL(string: urlString) else { print("error binding kraken url")
        return}
    
    URLSession.shared.dataTask(with: url as URL) { (data, response, error) in
        guard let data = data else { print("error binding kraken  data  parameter in URLSession")
            return}
        do {
            guard let jsonDictionaries = try [JSONSerialization.jsonObject(with: data, options: .mutableContainers)] as? [[String: AnyObject]] else { print("error binding kraken json-dictionaries to array of arrays (Kraken API OHLC format)")
                return}
            
            completion(
                jsonDictionaries.map({
                    return KrakenOHLCChunk(dictionary: $0)})
            )
        } catch let jsonSerializationError {
            print("Error serializing json:", jsonSerializationError)
        }
        
        DispatchQueue.main.async {                                                  //print("binding data from kraken api")
            exchangesReloaded[0] = 1
            checkExchangesReloaded()
        }
        }
        .resume()
}
