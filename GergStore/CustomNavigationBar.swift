//
//  CustomNavigationBar.swift
//  GergStore
//
//  Created by Nikhil Srivastava on 12/16/15.
//  Copyright © 2015 Nikhil Srivastava. All rights reserved.
//

import Foundation
import UIKit

class UINavigationBarTaller: UINavigationBar {
    ///The height you want your navigation bar to be of
    static let navigationBarHeight: CGFloat = 64
    
    ///The difference between new height and default height
    static let heightIncrease:CGFloat = navigationBarHeight - 44
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialize()
    }
    
    private func initialize() {
        let shift = UINavigationBarTaller.heightIncrease/2
        
        ///Transform all view to shift upward for [shift] point
        self.transform =
            CGAffineTransformMakeTranslation(0, -shift)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let shift = UINavigationBarTaller.heightIncrease/2
        
        ///Move the background down for [shift] point
        let classNamesToReposition: [String] = ["_UINavigationBarBackground"]
        for view: UIView in self.subviews {
            if classNamesToReposition.contains(NSStringFromClass(view.dynamicType)) {
                let bounds: CGRect = self.bounds
                var frame: CGRect = view.frame
                frame.origin.y = bounds.origin.y + shift - 20.0
                frame.size.height = bounds.size.height + 20.0
                view.frame = frame
            }
        }
    }
    
    override func sizeThatFits(size: CGSize) -> CGSize {
        let amendedSize:CGSize = super.sizeThatFits(size)
        let newSize:CGSize = CGSizeMake(amendedSize.width, UINavigationBarTaller.navigationBarHeight);
        return newSize;
    }
}