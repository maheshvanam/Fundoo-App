//
//  Helper.swift
//  FundooApp
//
//  Created by admin on 29/05/20.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation
import UIKit
class Helper {
    
    func getAttributedLogo() -> NSAttributedString {
        var colorsArray : [UIColor] = [ UIColor.blue , UIColor.red , UIColor.yellow ,
                                        UIColor.blue , UIColor.green , UIColor.red ]
        colorsArray.append(UIColor.blue)
        let attributedLogo = NSMutableAttributedString(string: "Fundoo")
        for i in 0...5 {
            attributedLogo.addAttribute(.foregroundColor,
                                        value: colorsArray[i], range: NSRange(location: i,length: 1))
        }
        return attributedLogo
    }
    
}
