//
//  ProductScreenViewController.swift
//  GergStore
//
//  Created by Nikhil Srivastava on 12/23/15.
//  Copyright © 2015 Nikhil Srivastava. All rights reserved.
//

import UIKit

class ProductScreenViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
