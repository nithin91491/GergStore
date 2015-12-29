//
//  SignInAndSignUpViewController.swift
//  GergStore
//
//  Created by Nikhil Srivastava on 12/15/15.
//  Copyright © 2015 Nikhil Srivastava. All rights reserved.
//

import UIKit

public enum modes{
    case SignIn
    case SignUp
}

public var modePublic:modes?

class SignInAndSignUpViewController: UIViewController,FBSDKLoginButtonDelegate,GIDSignInDelegate, GIDSignInUIDelegate {

    
    @IBOutlet weak var txtEmailAddress: UITextField!
    @IBOutlet weak var txtPasswordSignUp: UITextField!
    @IBOutlet weak var txtDateOfBirth: UITextField!
    @IBOutlet weak var segGender: UISegmentedControl!
    @IBOutlet weak var btnLogIn: UIButton!
    @IBOutlet weak var btnSignUp: UIButton!
    
    @IBOutlet weak var txtUserName: UITextField!
    
    @IBOutlet weak var txtPasswordLogIn: UITextField!
    
    @IBOutlet weak var imgBackground: UIImageView!
    
    @IBOutlet weak var bgImgViewContainer: UIView!
    
    
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
    
    @IBAction func googleLogInAction(sender: AnyObject) {
        GIDSignIn.sharedInstance().signIn()
    }
    
    
    //Default mode of SignUp
    var mode:modes = .SignUp
    var logInOrSignUpSuccessful:Bool = false
    
    @IBAction func logInButtonAction(sender: AnyObject) {
        
        if mode == .SignIn{
           
            performSegueWithIdentifier("signIn", sender: sender)
        }
        else{
            configureSignInScreen()
        }
        
    }
    
    
    @IBAction func signUpButtonAction(sender: AnyObject) {
      
        if mode == .SignUp{
            
            performSegueWithIdentifier("signUp", sender: sender)
          
        }
        else{
            configureSignUpScreen()
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().clientID = "641217175768-pfh9t86jjkkr2031euoppdh18bpjk2bo.apps.googleusercontent.com"
        
        GIDSignIn.sharedInstance().signInSilently()
        
        modePublic = mode
        
        self.bgImgViewContainer.layer.shadowColor = UIColor.blackColor().CGColor
        self.bgImgViewContainer.layer.shadowOffset = CGSizeZero
        self.bgImgViewContainer.layer.shadowOpacity = 0.8
        self.bgImgViewContainer.layer.shadowRadius = 5
        //self.bgImgViewContainer.layer.shadowPath = UIBezierPath(rect: self.bgImgViewContainer.bounds).CGPath
        
        if mode == .SignIn {
           configureSignInScreen()
        }
        else{
            configureSignUpScreen()
        }
        
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .Date
        txtDateOfBirth.inputView = datePicker
        
        datePicker.addTarget(self, action: "dateDidChange:", forControlEvents: .ValueChanged)
        
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.Default
        toolBar.translucent = true
        toolBar.tintColor = UIColor.blueColor()
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.Plain, target: self, action: "donePicker")
        
        toolBar.setItems([doneButton], animated: true)
        toolBar.userInteractionEnabled = true
        txtDateOfBirth.inputAccessoryView = toolBar
        
    }
    
    func dateDidChange(sender:UIDatePicker){
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = .MediumStyle
        let dateString = dateFormatter.stringFromDate(sender.date)
        self.txtDateOfBirth.text = dateString
    }

    func donePicker(){
        self.view.endEditing(true)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        //git
    }
    

   
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        
        
        
    }
    
    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject?) -> Bool {
       return false
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    // MARK: - User Defined Functions
    
    //tag 0 - Always present
    //tag 1 - SignUp views
    //tag 2 - SignIn views
    
    func configureSignInScreen(){
        
        mode = .SignIn
        modePublic = mode
        
        
        btnSignUp.setImage(UIImage(named: "loginscreen-signup"), forState: .Normal)
        btnLogIn.setImage(UIImage(named: "loginscreen-loginbutton"), forState: .Normal)
        
        btnSignUp.imageView?.contentMode = .ScaleAspectFill
        btnLogIn.imageView?.contentMode = .ScaleAspectFill
        
        let imageView1 = UIImageView(image: UIImage(named: "UsernameIcon"))
        let rightView1 = UIView(frame: CGRectMake(0, 0, imageView1.frame.width+10, imageView1.frame.height))
        rightView1.addSubview(imageView1)
        txtUserName.rightView = rightView1
        txtUserName.rightViewMode = .Always
        
        let imageView2 = UIImageView(image: UIImage(named: "PwdIcon"))
        let rightView2 = UIView(frame: CGRectMake(0, 0, imageView2.frame.width+10, imageView2.frame.height))
        rightView2.addSubview(imageView2)
        txtPasswordLogIn.rightView = rightView2
        txtPasswordLogIn.rightViewMode = .Always
        
        for v in self.view.subviews{
            if v.tag == 1{
                v.hidden=true   //hides all SignUp views
                self.view.sendSubviewToBack(v)
            }
            else if v.tag == 2{
                v.hidden=false  //unhides all SingIn views
                self.view.bringSubviewToFront(v)
            }
        }
    }
    
    func configureSignUpScreen(){
        
        mode = .SignUp
        modePublic = mode
        
        btnSignUp.setImage(UIImage(named: "newuser-signupbutton"), forState: .Normal)
        btnLogIn.setImage(UIImage(named: "signup-login"), forState: .Normal)
        
        btnSignUp.imageView?.contentMode = .ScaleAspectFill
        btnLogIn.imageView?.contentMode = .ScaleAspectFill
        
        
        for v in self.view.subviews{
            
            if v.tag == 1{
                v.hidden=false   //unhides all SignUp views
                self.view.bringSubviewToFront(v)
            }
            else if v.tag == 2{
                v.hidden=true  //hides all SingIn views
                self.view.sendSubviewToBack(v)
            }
            
        }
 
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

    
    

}
