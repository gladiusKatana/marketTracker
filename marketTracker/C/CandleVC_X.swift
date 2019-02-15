//  CandleVC_X.swift
//  CandleTap
//  Created by Garth Snyder on 2018-11-13.      //  Copyright © 2018 Garth Snyder. All rights reserved.
import UIKit

var highs = [Double]();  var lows = [Double]()              //var lowerWickRanges = [Double]();   var upperWickRanges = [Double]()

extension CandleVC {
    func showCandles() {
        if let keyWindow = UIApplication.shared.keyWindow {
            let candleViewWidth = keyWindow.frame.height;  let candleViewHeight = keyWindow.frame.width
            
            var n = 0
//            var highs = [Double]();  var lows = [Double]()            //var lowerWickRanges = [Double]();   var upperWickRanges = [Double]()
            
            for arr in binanceCandleSub {                               //print(arr)
                highs.append(Double("\(arr[2])")!)
                lows.append(Double("\(arr[3])")!)
                n += 1
            }                                                           //; print("\nlows: \(lows)\n");  print("highs: \(highs)\n") //**
            let absHigh = highs.max()!
            let absLow = lows.min()!; let range = absHigh - absLow      //; print("range: \(range)\n") //print("\ncandle ranges: \(candleRanges)")
            let scaledRange = Double(candleViewWidth - 60 - 40)         //print("\nscaled range: \(scaledRange)\n")
            let scalar = scaledRange / range
            
            for i in 0 ... binanceCandleSub.count - 1 {                 //print("#\(i+1)")
                
                let open = Double("\(binanceCandleSub[i][1])")!// 3, for the 'pretend there's no wick + green only' test//******************
                let high = Double("\(binanceCandleSub[i][2])")!
                let low = Double("\(binanceCandleSub[i][3])")!
                let close = Double("\(binanceCandleSub[i][4])")!// 2, for the 'pretend there's no wick + green only' test
                
                let candleGap = CGFloat(0.5)
                let candleWidth = CGFloat(candleViewHeight - candleGap) / CGFloat(binanceCandleSub.count) //incl. (non-leftmost) gap
                
                let wickWidth = CGFloat(0.5)
                let wickX = candleGap + 0.5 * (candleWidth - candleGap - wickWidth) + candleWidth * CGFloat(i)
                
                var candleColour = UIColor();        let wickColour = UIColor.white
                if close < open {candleColour = .red}
                else if close == open {candleColour = .yellow}          //; print("close = open at candle \(i)")}
                else {candleColour = .green}
                
                let candleHeight = scalar * abs(close - open)                  // next 6 lines: // 'Top' is measured from bottom... also:
                let candleTop = 40 + scalar * abs(max(open, close) - absLow)   // abs() prob. not needed, this line & below;...
                
                let upperWickHeight = scalar * abs(high - max(open, close))
                let upperWickTop = 40 + scalar * abs(high - absLow)
                
                let lowerWickHeight = scalar * abs(min(open, close) - low)     // ...& 'abs' in  abs-Low  =  *absolute* low; absHigh: ditto
                let lowerWickTop = 40 + scalar * abs(min(open, close) - absLow)
                
                let candleRect = CGRect(x: candleGap + candleWidth * CGFloat(i),
                                        y: candleViewWidth - CGFloat(candleTop),
                                        width: candleWidth - candleGap,
                                        height: CGFloat(candleHeight))
                
                let upperWickRect = CGRect(x: wickX,
                                           y: candleViewWidth - CGFloat(upperWickTop),
                                           width: wickWidth,
                                           height: CGFloat(upperWickHeight))
                
                let lowerWickRect = CGRect(x: wickX,
                                           y: candleViewWidth - CGFloat(lowerWickTop),
                                           width: wickWidth,
                                           height: CGFloat(lowerWickHeight))
                
                let kandle = Candle(frame: candleRect);          kandle.backgroundColor = candleColour
                view.addSubview(kandle)
                
                let topWick = Candle(frame: upperWickRect);      topWick.backgroundColor = wickColour
                view.addSubview(topWick)
                
                let bottomWick = Candle(frame: lowerWickRect);   bottomWick.backgroundColor = wickColour
                view.addSubview(bottomWick)
            }
            // *
            //var binanceCandleSample = binance Candles!.suffix(200) //as! [[AnyObject]] //https://developer.apple.com/documentation/swift/arrayslice
        }
    }
}
//print(" Open time         Open         High       Low        Close        Volume      Close time       QAV   #Trades   TBAV        TQAV    (ignore)")
            //**
//print("(\n\n\(binanceCandleSub.count) samples, \(highs.count) highs & \(lows.count) lows, sampled from 500\n")
