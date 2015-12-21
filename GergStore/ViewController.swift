//
//  ViewController.swift
//  GergStore
//
//  Created by Nikhil Srivastava on 12/21/15.
//  Copyright © 2015 Nikhil Srivastava. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        
        let searchbar = UISearchController(searchResultsController: nil)
        //searchbar.searchBar.frame = CGRectMake(10, 10, 200, 30)
        self.navigationItem.titleView = searchbar.searchBar
        
        
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
