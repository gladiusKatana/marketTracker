//  NavBarSetup.swift
//  CandleTap
//  Created by Garth Snyder on 2018-11-17.      //  Copyright © 2018 Garth Snyder. All rights reserved.
import UIKit

extension TradePanelVC {
    
    func setupNavBarButtons(_ withCustomColour: UIColor?, atIndex: Int?) {
        reloadTableButton = setupReloadButton()
        navigationItem.rightBarButtonItems = [reloadTableButton]
        
        var barButtonColours = [platinum, UIColor.clear]
        
        for button in navigationItem.rightBarButtonItems! {
            if let index = navigationItem.rightBarButtonItems?.index(of: button) {
                button.tintColor = barButtonColours[index]
            }
        }
        
        if let customColour = withCustomColour {
            if let colourIndex = atIndex {
                navigationItem.rightBarButtonItems?[colourIndex].tintColor = customColour
            } else {print("<no custom colour index>")}
        } //else {print("<no custom colour>")}
    }
    
    
    func setupReloadButton() -> UIBarButtonItem {
        let reloadImage = UIImage(named: "reloadButton")?.withRenderingMode(.alwaysTemplate)
        let reloadButton = UIBarButtonItem(image: reloadImage, landscapeImagePhone: reloadImage, style: .plain, target: self, action: #selector(getFeeds))
        return reloadButton
    }
}



