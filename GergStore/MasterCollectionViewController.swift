//
//  MasterCollectionViewController.swift
//  GergStore
//
//  Created by Nikhil Srivastava on 12/17/15.
//  Copyright © 2015 Nikhil Srivastava. All rights reserved.
//

import Foundation
import UIKit

class MasterCollectionViewController:NSObject,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    weak var viewController:UIViewController!
    weak var CollectionView:UICollectionView!
    
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
       
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("masterCollectionViewCell", forIndexPath: indexPath) as! MasterCollectionViewCell
        
        cell.imageView.image = UIImage(named: "categoryImage.tiff")
        cell.layer.shadowColor = UIColor.blackColor().CGColor
        cell.layer.shadowOffset = CGSizeMake(6, 6)
        return cell
        
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    
    
    
}