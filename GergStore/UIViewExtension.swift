//
//  UIViewExtension.swift
//  GergStore
//
//  Created by Nikhil Srivastava on 12/15/15.
//  Copyright © 2015 Nikhil Srivastava. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    @IBInspectable var borderColor : UIColor? {
        set (newValue) {
            self.layer.borderColor = (newValue ?? UIColor.clearColor()).CGColor
        }
        get {
            return UIColor(CGColor: self.layer.borderColor ?? UIColor.clearColor().CGColor)
        }
    }
}