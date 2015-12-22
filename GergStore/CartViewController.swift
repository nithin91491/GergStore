//
//  CartViewController.swift
//  GergStore
//
//  Created by Nikhil Srivastava on 12/21/15.
//  Copyright © 2015 Nikhil Srivastava. All rights reserved.
//

import UIKit

class CartViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,CustomSearchControllerDelegate {

    var customSearchController:CustomSearchController!

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    
        let barTintColor = UIColor(red: 80/255, green: 185/255, blue: 254/255, alpha: 1)
        customSearchController = CustomSearchController(searchResultsController: self, searchBarFrame: CGRectMake(0.0, 0.0, 200.0, 25.0), searchBarFont: UIFont(name: "Futura", size: 16.0)!, searchBarTextColor: UIColor.orangeColor(), searchBarTintColor: barTintColor)
        
        customSearchController.customSearchBar.placeholder = "Search"
        
        let frame = CGRectMake(0, 0, 200, 25.0)
        
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
    
    //MARK : - Delegate Methods
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cartCell", forIndexPath: indexPath)
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 60
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "You have 3 items in your cart"
    }
    
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
