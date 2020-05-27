//
//  Extension.swift
//  FundooApp
//
//  Created by admin on 27/05/20.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation
import UIKit

extension UITextField {
    
    func setShadowColor(color: CGColor) {
        self.borderStyle = .roundedRect
        self.layer.shadowColor = color
        self.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 0.0
    }
    
    func clearShadowColor() {
        self.layer.shadowColor = UIColor.clear.cgColor
    }
}
