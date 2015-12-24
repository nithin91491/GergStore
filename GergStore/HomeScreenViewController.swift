//
//  ViewController.swift
//  GergStore
//
//  Created by Nikhil Srivastava on 12/13/15.
//  Copyright © 2015 Nikhil Srivastava. All rights reserved.
//

import UIKit

class HomeScreenViewController: UIViewController,FBSDKLoginButtonDelegate {
    
    let facebookReadPermissions = ["public_profile", "email", "user_friends"]

    @IBAction func facebookLogInAction(sender: AnyObject) {
        
        let fbLogInManager = FBSDKLoginManager()
        fbLogInManager.logInWithReadPermissions(self.facebookReadPermissions, fromViewController: self, handler: {
            (result:FBSDKLoginManagerLoginResult!,error:NSError!) in
            
            if error != nil {
                print("FB Log in error")
            }
            else if result.isCancelled{
                print("cancelled")
            }
            else{
                print("Logged in")
            }
            
        })

    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
//        if (FBSDKAccessToken.currentAccessToken() != nil)
//        {
//            // User is already logged in, do work such as go to next view controller.
//        }
//        else
//        {
//            let loginView : FBSDKLoginButton = FBSDKLoginButton()
//            self.view.addSubview(loginView)
//            loginView.center = self.view.center
//            loginView.readPermissions = ["public_profile", "email", "user_friends"]
//            loginView.delegate = self
//        }
    }
    
    
    
    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!) {
        print("User Logged In")
        
        if ((error) != nil)
        {
            // Process error
        }
        else if result.isCancelled {
            // Handle cancellations
        }
        else {
            // If you ask for multiple permissions at once, you
            // should check if specific permissions missing
            if result.grantedPermissions.contains("email")
            {
                // Do work
            }
        }
    }
    
    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!) {
        print("User Logged Out")
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

