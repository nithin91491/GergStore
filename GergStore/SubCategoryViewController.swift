//
//  SubCategoryViewController.swift
//  GergStore
//
//  Created by Nikhil Srivastava on 12/18/15.
//  Copyright © 2015 Nikhil Srivastava. All rights reserved.
//

import UIKit

class SubCategoryViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UITextFieldDelegate,CustomSearchControllerDelegate {

    var customSearchController:CustomSearchController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        if self.revealViewController() != nil {
            self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "menu"), style: .Plain, target: self.revealViewController(), action: "revealToggle:")
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        
        let barTintColor = UIColor(red: 80/255, green: 185/255, blue: 254/255, alpha: 1)
        
        customSearchController = CustomSearchController(searchResultsController: self, searchBarFrame: CGRectMake(0.0, 0.0, 200.0, 25.0), searchBarFont: UIFont(name: "Futura", size: 16.0)!, searchBarTextColor: UIColor.orangeColor(), searchBarTintColor: barTintColor)
        
        customSearchController.customSearchBar.placeholder = "Search"
        
        let frame = CGRectMake(0, 0, 200, 25.0)
        
        let titleViewCustom = UIView(frame:frame)
        
        titleViewCustom.addSubview(customSearchController.customSearchBar)
        //customSearchController.customSearchBar.sizeToFit()
        titleViewCustom.backgroundColor = UIColor.clearColor()
        //titleViewCustom.sizeToFit()
        self.navigationItem.titleView = titleViewCustom
        customSearchController.customDelegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        return false
    }
    
    //MARK : - Delegate Methods
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("subCategoryCell", forIndexPath: indexPath) as! SubCategoryCollectionViewCell
        cell.imageView.image = UIImage(named: "pinkFW")
        cell.lblProductName.text = "Pink Footwear"
        cell.lblCategoryName.text = "Women's Footwear"
        cell.lblPrice.text = "Rs.2358"
        return cell
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
    
    //Custom search controller delegate methods
    func didStartSearching() {
        //        shouldShowSearchResults = true
        //        tblSearchResults.reloadData()
    }
    
    
    func didTapOnSearchButton() {
        //        if !shouldShowSearchResults {
        //            shouldShowSearchResults = true
        //            tblSearchResults.reloadData()
        //        }
    }
    
    
    func didTapOnCancelButton() {
        //        shouldShowSearchResults = false
        //        tblSearchResults.reloadData()
    }
    
    
    func didChangeSearchText(searchText: String) {
        // Filter the data array and get only those countries that match the search text.
        //        filteredArray = dataArray.filter({ (country) -> Bool in
        //            let countryText: NSString = country
        //
        //            return (countryText.rangeOfString(searchText, options: NSStringCompareOptions.CaseInsensitiveSearch).location) != NSNotFound
        //        })
        //
        //        // Reload the tableview.
        //        tblSearchResults.reloadData()
    }


}
