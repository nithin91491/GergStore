//
//  CategoryViewController.swift
//  GergStore
//
//  Created by Nikhil Srivastava on 12/17/15.
//  Copyright © 2015 Nikhil Srivastava. All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController {

    
    @IBOutlet weak var masterCollectionView: UICollectionView!
    @IBOutlet weak var detailCollectionView: UICollectionView!
    
    var masterCollectionViewController:MasterCollectionViewController!
    var detailCollectionViewController:DetailCollectionViewController!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        masterCollectionViewController = MasterCollectionViewController()
        masterCollectionViewController.viewController = self
        masterCollectionViewController.CollectionView = masterCollectionView
        masterCollectionView.dataSource = masterCollectionViewController
        masterCollectionView.delegate = masterCollectionViewController
        
        detailCollectionViewController = DetailCollectionViewController()
        detailCollectionViewController.viewController = self
        detailCollectionViewController.collectionView = detailCollectionView
        detailCollectionView.delegate = detailCollectionViewController
        detailCollectionView.dataSource = detailCollectionViewController
        
        //Set up Hamburger Menu
        if self.revealViewController() != nil {
             self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "menu"), style: .Plain, target: self.revealViewController(), action: "revealToggle:")
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        
        //Set up SearchController
        let searchResultsController = SearchResultsController()
        
        let frame = CGRectMake(0, 0, 200, 25.0)
        
        let titleViewCustom = UIView(frame:frame)
        titleViewCustom.addSubview(searchResultsController.customSearchController.customSearchBar)
        titleViewCustom.backgroundColor = UIColor.clearColor()
        self.navigationItem.titleView = titleViewCustom
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        var insets = self.masterCollectionView.contentInset
        let value = (self.view.frame.size.width - (self.masterCollectionView.collectionViewLayout as! UICollectionViewFlowLayout).itemSize.width) * 0.5
        insets.left = value
        insets.right = value
        self.masterCollectionView.contentInset = insets
        self.masterCollectionView.decelerationRate = UIScrollViewDecelerationRateFast;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
}
