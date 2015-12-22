//
//  ViewController.swift
//  GergStore
//
//  Created by Nikhil Srivastava on 12/21/15.
//  Copyright © 2015 Nikhil Srivastava. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UISearchResultsUpdating, CustomSearchControllerDelegate {

    var customSearchController: CustomSearchController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    
        let barTintColor = UIColor(red: 80/255, green: 185/255, blue: 254/255, alpha: 1)
        
        customSearchController = CustomSearchController(searchResultsController: self, searchBarFrame: CGRectMake(0.0, 0.0, 300.0, 40.0), searchBarFont: UIFont(name: "Futura", size: 16.0)!, searchBarTextColor: UIColor.orangeColor(), searchBarTintColor: barTintColor)
        
        customSearchController.customSearchBar.placeholder = "Search here"
        
        let frame = CGRectMake(0, 0, 300, 40.0)
        let titleViewCustom = UIView(frame:frame)
        
        titleViewCustom.addSubview(customSearchController.customSearchBar)
        titleViewCustom.backgroundColor = UIColor.clearColor()
        self.navigationItem.titleView = titleViewCustom
        customSearchController.customDelegate = self
        
        
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
    
    
    
    // MARK: UISearchResultsUpdating delegate function
    
    func updateSearchResultsForSearchController(searchController: UISearchController) {
//        guard let searchString = searchController.searchBar.text else {
//            return
//        }
//        
//        // Filter the data array and get only those countries that match the search text.
//        filteredArray = dataArray.filter({ (country) -> Bool in
//            let countryText:NSString = country
//            
//            return (countryText.rangeOfString(searchString, options: NSStringCompareOptions.CaseInsensitiveSearch).location) != NSNotFound
//        })
//        
//        // Reload the tableview.
//        tblSearchResults.reloadData()
    }
    
    
    
    
    // MARK: CustomSearchControllerDelegate functions
    
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
