//
//  CustomUIView.swift
//  GergStore
//
//  Created by Nikhil Srivastava on 12/16/15.
//  Copyright © 2015 Nikhil Srivastava. All rights reserved.
//

import Foundation
import UIKit

class TextFieldIgnoringTouches: UITextField {
    
    
    
    override func hitTest(point: CGPoint, withEvent event: UIEvent?) -> UIView? {
        
        let hitView = super.hitTest(point, withEvent: event)
        
        if hitView == self {//&& modePublic == .SignUp {
            return nil
        }
        else{
            return hitView
        }
        
    }
}

class LabelIgnoringTouches: UILabel {
    
    
    
    override func hitTest(point: CGPoint, withEvent event: UIEvent?) -> UIView? {
        
        let hitView = super.hitTest(point, withEvent: event)
        
        if hitView == self {//&& modePublic == .SignUp {
            return nil
        }
        else{
            return hitView
        }
        
    }
}