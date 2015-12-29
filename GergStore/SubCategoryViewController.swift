//
//  SubCategoryViewController.swift
//  GergStore
//
//  Created by Nikhil Srivastava on 12/18/15.
//  Copyright © 2015 Nikhil Srivastava. All rights reserved.
//

import UIKit

class SubCategoryViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionVIew: UICollectionView!
    
    var isListView:Bool = false
    
    @IBAction func viewTypeDidChange(sender: AnyObject) {
       
        let segmentControl = sender as! UISegmentedControl
        if segmentControl.selectedSegmentIndex == 0 {
            //Grid View
            isListView = false
        }
        else { // List View
            isListView = true
        }
        self.collectionVIew.reloadData()
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //Set Up Hamburger Menu
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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
       
    //MARK : - Delegate Methods
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        
        let cell:SubCategoryCollectionViewCell
        
        if !isListView{
            cell = collectionView.dequeueReusableCellWithReuseIdentifier("subCategoryCell", forIndexPath: indexPath) as! SubCategoryCollectionViewCell
        }
        else{
             cell = collectionView.dequeueReusableCellWithReuseIdentifier("subCategoryListCell", forIndexPath: indexPath) as! SubCategoryCollectionViewCell
        }
        
        cell.imageView.image = UIImage(named: "pinkFW")
        cell.lblProductName.text = "Pink Footwear"
        cell.lblCategoryName.text = "Women's Footwear"
        cell.lblPrice.text = "Rs.2358"
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        if isListView{
            return CGSizeMake(collectionView.frame.width-60, 100)
        }
        else{
            return CGSizeMake(100, 150)
        }
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        
        if isListView{
        return 1.0
        }
        else{
            return 10
        }
    }
    
  
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       
      return 10
        
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
