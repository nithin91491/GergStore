//
//  CustomFlowLayout.swift
//  GergStore
//
//  Created by Nikhil Srivastava on 12/23/15.
//  Copyright © 2015 Nikhil Srivastava. All rights reserved.
//

import UIKit

class TableViewLayout:UICollectionViewLayout {
    var sz:CGSize!
    var atts:[NSIndexPath:UICollectionViewLayoutAttributes]! = [:]
    
    
    override func prepareLayout() {
        
        let sections =  self.collectionView!.numberOfSections()
        // work out cell size based on bounds size
        let sz = self.collectionView!.bounds.size
        let width = sz.width
//        let shortside = floor(width/50.0)
//        let cellside = width/shortside
        // generate attributes for all cells
        //var x = 0
        var y = 0
        var atts = [UICollectionViewLayoutAttributes]()
        for i in 0 ..< sections {
            let jj = self.collectionView!.numberOfItemsInSection(i)
            for j in 0 ..< jj {
            let att = UICollectionViewLayoutAttributes(
            forCellWithIndexPath:
            NSIndexPath(forItem:j, inSection:i))
            att.frame = CGRectMake(
            0,CGFloat(y),width,100.0)
            atts += [att]
//            x++
//            if CGFloat(x) >= shortside {
//            x = 0
//            y++ }
            y += 100
            }
        }
        for att in atts {
            self.atts[att.indexPath] = att
        }
        //let fluff = (x == 0) ? 0 : 1
        self.sz = CGSizeMake(width, CGFloat(y))
    }
    
    override func collectionViewContentSize() -> CGSize {
            return self.sz
    }
    override func layoutAttributesForElementsInRect(rect: CGRect)
            -> [UICollectionViewLayoutAttributes]? {
            return Array(self.atts.values)
    }
    override func layoutAttributesForItemAtIndexPath(indexPath: NSIndexPath)
            -> UICollectionViewLayoutAttributes? {
            return self.atts[indexPath]
    }
    
}
