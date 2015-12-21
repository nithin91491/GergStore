//
//  DetailCollectionViewController.swift
//  GergStore
//
//  Created by Nikhil Srivastava on 12/17/15.
//  Copyright © 2015 Nikhil Srivastava. All rights reserved.
//

import Foundation
import UIKit

class DetailCollectionViewController:NSObject,UICollectionViewDelegate,UICollectionViewDataSource{
    
    weak var viewController:UIViewController!
    weak var collectionView:UICollectionView!
    
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("detailCollectionViewCell", forIndexPath: indexPath) as! DetailCollectionViewCell
        cell.imageView.image = UIImage(named: "images")
        cell.lblCategoryName.text = "Foot Wear"
        return cell
        
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    
    
    
}