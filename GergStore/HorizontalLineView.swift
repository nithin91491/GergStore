//
//  HorizontalLineView.swift
//  GergStore
//
//  Created by Nikhil Srivastava on 12/15/15.
//  Copyright © 2015 Nikhil Srivastava. All rights reserved.
//

import Foundation
import UIKit

class HorizontalLine: UIView {
    
    override func drawRect(rect: CGRect) {
        
        let path = UIBezierPath()
        path.moveToPoint(CGPointMake(10.0, 10.0))
        path.addLineToPoint(CGPointMake(100.0, 100.0))
        path.lineWidth = 1
        UIColor.lightGrayColor().setStroke()
        path.stroke()
        
        
    }
    
    
}
