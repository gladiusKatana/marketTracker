//  CollectionViewLayout.swift
//  CandleTap
//  Created by Garth Snyder on 2018-11-17.      //  Copyright © 2018 Garth Snyder. All rights reserved.
import UIKit

class CollectionViewLayout: UICollectionViewLayout {
    var tableAttributesInRect = [UICollectionViewLayoutAttributes]()
    var tableContentSize = CGSize.zero
    var tableCellAttributesDictionary = Dictionary<IndexPath, UICollectionViewLayoutAttributes>()
    
    override var collectionViewContentSize: CGSize {
        get { return tableContentSize }
    }
    override func prepare() {
        if !dataSourceDidUpdate {
            dataSourceDidUpdate = true //; print("<preparing layout>")//print("---------------------------------------------------prepare\n")
            setOrientationAdjustment()
            cellWidth = CGFloat(viewFrameWidth) / CGFloat(numSections)
            
            if scrollable {cellHeight = 30}
            else {
                if UIApplication.shared.statusBarFrame.height == 20 {
                    cellHeight = CGFloat(viewFrameHeight - 64) / CGFloat(numRows)
                }
                else if UIApplication.shared.statusBarFrame.height == 40 {
                    cellHeight = CGFloat(viewFrameHeight - 64 - 20) / CGFloat(numRows)
                }
                else {print("ERROR: status bar is neither expected height (20 or 40 points)")} //print("status bar height =
            }                                                                    //\(UIApplication.shared.statusBarFrame.height)")
            
            collectionView?.bounces = true
            
            for section in 0 ..< collectionView!.numberOfSections {
                for item in 0 ..< collectionView!.numberOfItems(inSection: section) {
                    let cellIndexPath = IndexPath(item: item, section: section)
                    let yPos = CGFloat(item) * cellHeight
                    let xPos = CGFloat(section) * cellWidth + CGFloat(additionalVerticalOffset)
                    
                    let cellAttributes = UICollectionViewLayoutAttributes(forCellWith: cellIndexPath)
                    cellAttributes.frame = CGRect(x: xPos, y: yPos, width: cellWidth, height: cellHeight)
                    determineZIndex(item: item, section: section, cellAttributes: cellAttributes)
                    tableCellAttributesDictionary[cellIndexPath] = cellAttributes
                }
            }
            let contentHeight = CGFloat(collectionView!.numberOfItems(inSection: 0)) * cellHeight
            let contentWidth = CGFloat(collectionView!.numberOfSections) * cellWidth
            tableContentSize = CGSize(width: contentWidth, height: contentHeight)
        }
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        for cellAttribs in tableCellAttributesDictionary.values {
            if rect.intersects(cellAttribs.frame) {
                tableAttributesInRect.append(cellAttribs)
            }
        }
        return tableAttributesInRect
    }
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? { //uncomment?
        return tableCellAttributesDictionary[indexPath]
    }
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return false
    }
}
