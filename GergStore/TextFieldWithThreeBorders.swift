//
//  TextFieldWithThreeBorders.swift
//  GergStore
//
//  Created by Nikhil Srivastava on 12/18/15.
//  Copyright © 2015 Nikhil Srivastava. All rights reserved.
//

import UIKit

class TextFieldWithThreeBorders: UITextField {

   
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
//
        super.drawRect(rect)
        
        let width:CGFloat = 1.0
        let borderRight = CALayer()
        borderRight.backgroundColor = UIColor.blackColor().CGColor
        borderRight.frame = CGRectMake(self.frame.size.width - width, 0, width, self.frame.size.height)
        self.layer.addSublayer(borderRight)
        
        let borderLeft = CALayer()
        borderLeft.backgroundColor = UIColor.blackColor().CGColor
        borderLeft.frame = CGRectMake(0, 0, width, self.frame.size.height)
        self.layer.addSublayer(borderLeft)
        
        let borderBottom = CALayer()
        borderBottom.backgroundColor = UIColor.blackColor().CGColor
        borderBottom.frame = CGRectMake(0, self.frame.size.height - width, self.frame.size.width, width)
        self.layer.addSublayer(borderBottom)
        
        
    }

   

}
