//
//  ViewController.swift
//  GergStore
//
//  Created by Nikhil Srivastava on 12/13/15.
//  Copyright © 2015 Nikhil Srivastava. All rights reserved.
//

import UIKit

class HomeScreenViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let destinationViewController = segue.destinationViewController as! SignInAndSignUpViewController
        
        
        if(segue.identifier == "signIn"){
           destinationViewController.mode = .SignIn
        }
        else{
            destinationViewController.mode = .SignUp
        }
        
        
        
    }
    

}

