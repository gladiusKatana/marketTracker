//  Shakepay.swift
//  MarketTracker  ∙  Created 2018-11-17 by Garth Snyder a.k.a. gladiusKatana ⚔️

import UIKit    //;   import Foundation

class ShakepayPriceUpdate: SafeJsonObject {
    @objc var BTC_CAD: AnyObject?
    @objc var CAD_BTC: AnyObject?
    @objc var ETH_CAD: AnyObject?
    @objc var CAD_ETH: AnyObject?
    @objc var BTC_USD: AnyObject?
    @objc var USD_BTC: AnyObject?
    @objc var ETH_USD: AnyObject?
    @objc var USD_ETH: AnyObject?
    @objc var BTC_ETH: AnyObject?
    @objc var ETH_BTC: AnyObject?
    
    init(dictionary: [String: AnyObject]) {
        super.init()
        setValuesForKeys(dictionary)
    }
}

func fetchShakepayFeedForUrlString(urlString: String, completion: @escaping ([ShakepayPriceUpdate]) -> ()) {    print("fetching shakepay")
    print("shakepay url: \(urlString)")
    guard let url = URL(string: urlString) else { print("error binding shakepay url")
        return}
    
    URLSession.shared.dataTask(with: url as URL) { (data, response, error) in
        guard let data = data else { print("error binding shakepay  data  parameter in URLSession")
            return}
        do {
            guard let jsonDictionaries = try [JSONSerialization.jsonObject(with: data, options: .mutableContainers)] as? [[String: AnyObject]] else { print("error binding shakepay json-dictionaries to array (Shakepay API format)")
                return}
            
            completion(
                jsonDictionaries.map({
                    return ShakepayPriceUpdate(dictionary: $0)})
            )
        } catch let jsonSerializationError {
            print("Error serializing json:", jsonSerializationError)
        }
        
        DispatchQueue.main.async {                                                              //print("binding data from shakepay api")
            exchangesReloaded[1] = 1
            checkExchangesReloaded()
        }
        }
        .resume()
}

