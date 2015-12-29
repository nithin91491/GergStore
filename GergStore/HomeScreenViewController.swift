//
//  ViewController.swift
//  GergStore
//
//  Created by Nikhil Srivastava on 12/13/15.
//  Copyright © 2015 Nikhil Srivastava. All rights reserved.
//

import UIKit

class HomeScreenViewController: UIViewController,FBSDKLoginButtonDelegate,GIDSignInDelegate, GIDSignInUIDelegate {
    
    let facebookReadPermissions = ["public_profile", "email", "user_friends"]
    

    @IBAction func googleLogInAction(sender: AnyObject) {
        
        
        GIDSignIn.sharedInstance().signIn()
        
        
    }
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
        
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().clientID = "641217175768-pfh9t86jjkkr2031euoppdh18bpjk2bo.apps.googleusercontent.com"
        
        GIDSignIn.sharedInstance().signInSilently()
        
        
    }
    
    
    
    //MARK: - Google SignIn delegate methods
    
    func signIn(signIn: GIDSignIn!, didSignInForUser user: GIDGoogleUser!, withError error: NSError!) {
        if let err = error {
            print(err)
        }
        else {
            //performSegueWithIdentifier("idSegueContent", sender: self)
        }
    }
    
    func signIn(signIn: GIDSignIn!, didDisconnectWithUser user: GIDGoogleUser!, withError error: NSError!) {
        
    }
    
    
    
    
    //MARK: - Facebook SignIn delegate methods
    
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

