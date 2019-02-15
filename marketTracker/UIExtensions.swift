//  UIExtensions.swift
//  CandleTap
//  Created by Garth Snyder on 2018-11-17.      //  Copyright © 2018 Garth Snyder. All rights reserved.
import UIKit

extension CollectionViewLayout {
    func setOrientationAdjustment() { //print("set orientation adjustment")
        if menuBarOn {additionalVerticalOffset = 20}
        else {additionalVerticalOffset = 0}                                   //print("additional offset: \(additionalVericalOffset)")
        if UIDevice.current.orientation.isPortrait {//* why layout updates called twice? //print("          layout update (Portrait)")
            orientationAdjustment = 0 - additionalVerticalOffset
        }
        else if UIDevice.current.orientation.isLandscape {                           //print("             layout update (Landscape)")
            orientationAdjustment = 12 - additionalVerticalOffset
        }
        else {                                                                              //print("problem with device orientation")
        }
        viewFrameHeight = globalKeyWindow!.frame.height
        viewFrameWidth = globalKeyWindow!.frame.width                     //; print("vFH: \(viewFrameHeight)  vfW: \(viewFrameWidth)")
    }
    
    func determineZIndex(item: Int, section: Int, cellAttributes: UICollectionViewLayoutAttributes) {// Determine zIndex from cell type
        if section == 0 && item == 0 {
            cellAttributes.zIndex = 4
        } else if section == 0 {
            cellAttributes.zIndex = 3
        } else if item == 0 {
            cellAttributes.zIndex = 2
        } else {
            cellAttributes.zIndex = 1
        }
    }
}

extension UIColor {
    static func rgb(_ red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: alpha)
    }
}

extension UIView {
    func addConstraintsWithFormat(_ format: String, views: UIView...) {
        var viewsDictionary = [String: UIView]()
        
        for (index, view) in views.enumerated() {
            let key = "v\(index)"
            view.translatesAutoresizingMaskIntoConstraints = false
            viewsDictionary[key] = view
        }
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: viewsDictionary))
    }
}

extension Double {
    func rounded(toPlaces places:Int)-> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}

extension Double {
    func truncate(places : Int)-> Double {
        return Double(floor(pow(10.0, Double(places)) * self)/pow(10.0, Double(places)))
    }
}


struct AppUtility {                                            //OK it's not an extension but this seems the best place for it (for now)
    static func lockOrientation(_ orientation: UIInterfaceOrientationMask) {
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
            appDelegate.orientationLock = orientation
        }
        else {
            print("[AppUtility] error casting app delegate instance")
        }
    }
    
    // optional Added method to adjust lock and rotate to the desired orientation
    static func lockOrientation(_ orientation: UIInterfaceOrientationMask, andRotateTo rotateOrientation:UIInterfaceOrientation) {
        self.lockOrientation(orientation)
        UIDevice.current.setValue(rotateOrientation.rawValue, forKey: "orientation")
    }
}
