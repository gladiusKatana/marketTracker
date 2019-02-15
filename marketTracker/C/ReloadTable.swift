//  CollectionView_ReloadTable.swift
//  CandleTap
//  Created by Garth Snyder on 2018-11-17.      //  Copyright © 2018 Garth Snyder. All rights reserved.
import UIKit

extension TradePanelVC {
    
    @objc func unlockAndReloadTable() {
        loadedTimetable = false
        reloadTable()
    }
    
    @objc func reloadTable() {                                                          // make this not necessary soon
        if !(self.loadedTimetable) {
            //print("              rt\n")
            print("------------------rt\n")
            DispatchQueue.main.asyncAfter(deadline: .now()) { [weak self] in
                self?.collectionView?.reloadData()
                self?.collectionView?.performBatchUpdates({ () -> Void in }, completion: nil)
                dataSourceDidUpdate = false
                ///self?.loadedTimetable = true //***
            }
            self.loadedTimetable = true
        }
    }
}
