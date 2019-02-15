//  Candle(View).swift
//  CandleTap
//  Created by Garth Snyder on 2018-11-13.      //  Copyright © 2018 Garth Snyder. All rights reserved.
import UIKit



class CandleView: UIView/*, UIGestureRecognizerDelegate*/ {
    
    override init(frame: CGRect) {                          print("🕯 (override init  candle view)")
        super.init(frame: frame)
//        //showCandles()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}




class Candle: UIView {
    
    lazy var dataBar: CGRect = {
        let bar = CGRect()
        return bar
    }()

    lazy var rectangleView: UIImageView = {
        let imageView = UIImageView()
        imageView.frame = CGRect(x: 20, y: 100, width: 150, height: 150)
        imageView.backgroundColor = .clear
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(frame: CGRect) {                 //print("   (override init  bar graph view)")
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}





