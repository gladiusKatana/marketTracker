//  CustomCell.swift
//  CandleTap
//  Created by Garth Snyder on 2018-11-17.      //  Copyright © 2018 Garth Snyder. All rights reserved.
import UIKit

class CustomCell: UICollectionViewCell {
    static let reuseIdentifier = "CustomCell"
    var cellColour = UIColor.clear
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.sizeToFit()
        label.adjustsFontSizeToFitWidth = true
        
        self.addSubview(label)
//        addConstraint(NSLayoutConstraint(item: label, attribute: .centerX, relatedBy: .equal,
//                                         toItem: self, attribute: .centerX, multiplier: 1, constant: 0))
//        addConstraint(NSLayoutConstraint(item: label, attribute: .centerY, relatedBy: .equal,
//                                         toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: label, attribute: .left, relatedBy: .equal,
                                         toItem: self, attribute: .left, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: label, attribute: .centerY, relatedBy: .equal,
                                         toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = ""
    }
}


