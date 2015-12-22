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

class SignInAndSignUpViewController: UIViewController {

    
    @IBOutlet weak var txtEmailAddress: UITextField!
    @IBOutlet weak var txtPasswordSignUp: UITextField!
    @IBOutlet weak var txtDateOfBirth: UITextField!
    @IBOutlet weak var segGender: UISegmentedControl!
    @IBOutlet weak var btnLogIn: UIButton!
    @IBOutlet weak var btnSignUp: UIButton!
    
    let blueColor = UIColor(red: 0.4, green: 0.81, blue: 1, alpha: 1)
    
    
    
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
        
        modePublic = mode
        
        if mode == .SignIn {
           configureSignInScreen()
        }
        else{
            configureSignUpScreen()
        }
        
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .Date
        txtDateOfBirth.inputView = datePicker
        
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
        
        modePublic = mode
        mode = .SignIn
        btnLogIn.backgroundColor = blueColor
        btnLogIn.titleLabel?.textColor = UIColor.blackColor()
        btnSignUp.backgroundColor = UIColor.lightGrayColor()
        btnSignUp.titleLabel?.textColor = UIColor.whiteColor()
        
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
        
        modePublic = mode
        mode = .SignUp
        btnLogIn.backgroundColor = UIColor.lightGrayColor()
        btnLogIn.titleLabel?.textColor = UIColor.whiteColor()
        btnSignUp.backgroundColor = blueColor
        btnSignUp.titleLabel?.textColor = UIColor.blackColor()
        
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
    
    
    

}
