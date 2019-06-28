//  CellLogic.swift
//  CandleTap
//  Created by Garth Snyder on 2018-11-17.      //  Copyright © 2018 Garth Snyder. All rights reserved.
import UIKit

extension TradePanelVC {
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCell.reuseIdentifier, for: indexPath) as! CustomCell
        let row = indexPath.row; let column = indexPath.section
        
        cell.backgroundColor = .clear;  cell.titleLabel.textColor = platinum
        cell.layer.borderWidth = 0.25; cell.layer.borderColor = UIColor.darkGray.cgColor
        cell.titleLabel.font = UIFont(name: "Helvetica", size: 10)
        cell.titleLabel.text = ""           //UIFont(name: "Helvetica", size: 12.0, weight: .light)
        
        //------------------------------------------------prices
        if loadedTimetable {
            if column == 1 && row == 3 {
                if let btcCadCurrent = krakenOHLCChunks?[0].result?.XXBTZCAD!.last![4] {
                    cell.titleLabel.text = "\(btcCadCurrent)0"   // ! note diff. between  .last  of Swift array & of kraken api type
                    latestKrakenBTCBuyPrice = Double("\(btcCadCurrent)")! //; print("last kraken btc buyprice: \(latestKrakenBTCBuyPrice)0")
                } else {print("did not bind BTCCAD price from kraken (in cell)")}
            }
            
            if column == 1 && row == 4 {
                if let latestETHBTC = binanceCandles?.last?[4] {
                    let latestETHBTCDouble = Double("\(latestETHBTC)")!
                    cell.titleLabel.text = "\(latestETHBTCDouble)"
                    //if showCandleViewAutomatically {openCandleViewer()}
                } else {print("did not bind BTCCAD price from binance (in cell)")}
            }
            
            //------------------------------------------------labels
            if column == 1 && row == 2 {
                cell.titleLabel.text = "price"
            }
            if column == 3 && row == 2 {
                cell.titleLabel.text = "time"
            }
            
            if column == 1 && row == 6 {
                cell.titleLabel.text = "↑  Tap the ETH:BTC price to see the last 100 hourly candles."
            }
            if column == 1 && row == 7 {
                cell.titleLabel.text = "      (Pinch outward to exit the chart window)"
            }
            
            //------------------------------------------------times
            if column == 3 && row == 3 {
                if let latestDate = krakenOHLCChunks?[0].result?.last {
                    let interval = Double(truncating: latestDate as! NSNumber)
                    let date = NSDate(timeIntervalSince1970: interval)
                    (tm, weekday, dy) = displayDate(dateCreated: date as Date)      //; print("last kraken date is \(tm, weekday, dy)")
                    cell.titleLabel.text = "\(tm) \(dy)"
                }
            }
            
            if column == 3 && row == 4 {
                if let latestBinancePriceDate = binanceCandles?.last?[0] {//Note binance date displays only as rounded to the hour. but price is current
                    if let dubl = Double("\(latestBinancePriceDate)") {             //print("unix timestamp: \(dubl)")
                        
                        let dublRounded = (dubl/1000).truncate(places: 10)          //; print("unix timestamp: \(dublRounded)  (truncated)")
                        
                        let binanceDate = NSDate(timeIntervalSince1970: dublRounded)
                        (tm, weekday, dy) = displayDate(dateCreated: binanceDate as Date)  //; print("last kraken date is \(tm, weekday, dy)")
                        cell.titleLabel.text = "\(tm) \(dy)"
                    }
                } else {print("did not bind BTCCAD price from binance (in cell)")}
            }

            //------------------------------------------------pricelabels etc
            if column == 5 {
                if row == 3 {
                    cell.titleLabel.text = "⟵ BTC:CAD market price: buying on Kraken"
                }
                if row == 4 {
                    cell.titleLabel.text = "⟵ ETH:BTC market price: buying on Binance"
                }
                if row == 10 {
                    cell.titleLabel.text = "...More market data & exchanges coming soon.  —gladiusKatana"
                }
            }
        }
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let row = indexPath.row; let column = indexPath.section
        
        if column == 1 && row == 4 {
            openCandleViewer()
        }
    }
}


