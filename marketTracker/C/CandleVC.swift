//  CandleVC.swift
//  CandleTap
//  Created by Garth Snyder on 2018-11-13.      //  Copyright © 2018 Garth Snyder. All rights reserved.
import UIKit

class CandleVC: UIViewController {
    lazy var candleView: CandleView = {
        let candleView = CandleView()
        print("candle view initialized")
        candleView.backgroundColor = .clear
        return candleView
    }()
    
//    lazy var candleView = CandleView()
    lazy var pinchToClose = UIPinchGestureRecognizer()

    override func viewDidLoad() { super.viewDidLoad() ; print("\n                            🕯L")
        AppUtility.lockOrientation(.landscapeLeft, andRotateTo: .landscapeLeft)
    }
    override func viewDidAppear(_ animated: Bool) {     print("\n                            🕯A")
        addCandleViewWithPinch()
    }
    
    func addCandleViewWithPinch() {
        if let keyWindow = UIApplication.shared.keyWindow {
            pinchToClose = UIPinchGestureRecognizer(target: self, action: #selector(closeCandleView))
            candleView.addGestureRecognizer(pinchToClose)
            candleView.frame = keyWindow.frame
            keyWindow.addSubview(candleView)
        }
        showCandles()
    }
    
    @objc func closeCandleView() {                     print("∘")
//        if pinchToClose.velocity > 0 {                 print("pinched out from candle view")           //called twice... why?
            if !justPinchedFromCandleView {
                justPinchedFromCandleView = true
                dismissCandleView()
            }
//        }
    }

    @objc func dismissCandleView() {
        candleViewShowing = false
        print("\n                                candleview showing? \(candleViewShowing)\n")
        candleView.removeFromSuperview()
        candleView.removeGestureRecognizer(pinchToClose)
        
        let navController = UINavigationController(rootViewController: tradePanelVC)
        self.navigationController?.present(navController, animated: false, completion: nil)
        
        
//        self.navigationController?.dismiss(animated: false, completion: nil)
        
        
//        navController = UINavigationController(rootViewController: tradePanelVC)
//        //self.navigationController?.present(navController, animated: false, completion: nil)
//        let apDel = UIApplication.shared.delegate as? AppDelegate
//        apDel!.window?.rootViewController = navController
    }
}





//         0            1           2          3           4            5             6             7         8          9
// [1543971120000, 0.02782500, 0.02783700, 0.02782500, 0.02782900, 16.44100000, 1543971179999, 0.45753156,    16,    8.71800000,  0.24263196, 0]
//      10     11
//     Open time      Open         High       Low        Close        Volume      Close time       QAV      #Trades     TBAV
//     TQAV    ignore

//                                                                  QAV = Quote Asset Volume;   TBAV = Taker buy BASE Asset Volume;
//                                                                                              TQAV = Taker buy QUOTE Asset Volume

//    override func viewDidDisappear(_ animated: Bool) {  print("\n                            🕯d")
//    }


