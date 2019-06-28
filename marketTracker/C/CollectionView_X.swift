//  CollectionView_Extensions.swift
//  CandleTap
//  Created by Garth Snyder on 2018-11-17.      //  Copyright © 2018 Garth Snyder. All rights reserved.
import UIKit;   import UserNotifications

extension TradePanelVC {
    
    func openCandleViewer() {               candleViewShowing = true

//        candleVC.addCandleViewWithPinch()
        
        let navController = UINavigationController(rootViewController: candleVC)

        self.navigationController?.present(navController, animated: false, completion: nil)
//        let apDel = UIApplication.shared.delegate as? AppDelegate
//        apDel!.window?.rootViewController = navController
    }
    
    func setupNotificationForStatusBarHeightChange() {
        let center = UNUserNotificationCenter.current()
        center.removeAllDeliveredNotifications()            // to remove all delivered notifications
        center.removeAllPendingNotificationRequests()       // to remove all pending notifications not delivered yet but scheduled.
        NotificationCenter.default.addObserver(self, selector: #selector(statusBarHeightChanged), name: UIApplication.willChangeStatusBarFrameNotification, object: nil)
    }
    
    @objc func statusBarHeightChanged() {                   //print("\nstatus bar height changed\n")
        if dataSourceDidUpdate {dataSourceDidUpdate = false}
        unlockAndReloadTable()
    }
    
    func checkCollectionViewControllerSubclass(vCType: UICollectionViewController) -> Bool {
        var typeCheck = false
        if let viewControllers = self.navigationController?.viewControllers {
            for _ in viewControllers {
                if viewControllers.contains(vCType) {                       /*if vc.isKind(of: vCType) {*/ //print("view controller: \(vc)")
                    typeCheck = true
                }
                else {typeCheck = false}
            }                                                               //; print("view controllers: \(viewControllers)")
        }
        return typeCheck
    }
    
    func setupHeaderTitle(titleText: String, numLines: Int, alignment: NSTextAlignment) {
        headerTitleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 20))
        headerTitleLabel.backgroundColor = .clear
        headerTitleLabel.text = titleText; headerTitleLabel.numberOfLines = numLines
        headerTitleLabel.textAlignment = alignment; headerTitleLabel.font = UIFont(name: "Helvetica", size: 14.0)
        headerTitleLabel.textColor = platinum
        navigationItem.titleView = headerTitleLabel
        headerTitleLabel.isUserInteractionEnabled = false
    }
}

