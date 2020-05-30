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
    
    func setBackgroundColour() {
        self.layer.borderWidth = 1.0
        self.layer.cornerRadius = 5.0
        self.layer.borderColor = UIColor.red.cgColor
    }
    
    func clearBackgroundColor() {
        self.layer.borderColor = UIColor.clear.cgColor
    }
}
