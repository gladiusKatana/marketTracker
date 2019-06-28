//  TradePanelVC.swift
//  CandleTap
//  Created by Garth Snyder on 2018-11-17.      //  Copyright © 2018 Garth Snyder. All rights reserved.
import UIKit;   import ContactsUI


class TradePanelVC: UICollectionViewController {
    var loadedTimetable = false
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override init(/*tableActive: Bool, timerSymbol: String?, */collectionViewLayout layout: UICollectionViewLayout) {
        super.init(collectionViewLayout: layout)
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {return numSections}
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {return numRows}
    
    override func viewDidLoad() {   super.viewDidLoad()
        vcLoaded = "panel"                       ; print("\n                            🖥L")
//        if showCandleViewAutomatically{
//            AppUtility.lockOrientation(.portrait, andRotateTo: .portrait)
//        }
//        else {
            ///AppUtility.lockOrientation(.landscapeLeft, andRotateTo: .landscapeLeft)
//        }
        collectionView?.register(CustomCell.self, forCellWithReuseIdentifier: CustomCell.reuseIdentifier) //CustomCell.reuseIdentifier
        collectionView?.backgroundColor = .clear
        collectionView?.isPrefetchingEnabled = true
        collectionView?.indicatorStyle = UIScrollView.IndicatorStyle.black
        collectionView?.isScrollEnabled = true
        
        setupHeaderTitle(titleText: tableHeaderString, numLines: 1, alignment: .left)
        setupNavBarButtons(nil, atIndex: nil)
        setupNotificationForStatusBarHeightChange()
        
//        if candlesShowing {
//            //let candleVC = CandleVC()
//            candleVC.candleView.removeFromSuperview()
//        }
    }
    
    override func viewDidAppear(_ animated: Bool) { print("\n                            🖥A\n") //  candleview showing? \(candleViewShowing)
        setupNavBarButtons(nil, atIndex: nil)
        justPinchedFromCandleView = false
    }
}

