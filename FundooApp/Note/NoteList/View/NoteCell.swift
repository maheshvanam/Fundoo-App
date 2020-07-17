//
//  NoteCell.swift
//  FundooApp
//
//  Created by admin on 06/06/20.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation
import UIKit

class NoteCell: UICollectionViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var discriptionLabel: UILabel!
    
    func setShadow() {
        self.layer.shadowColor   = UIColor.black.cgColor
        self.layer.shadowOffset  = CGSize(width: 0.0, height: 1.0)
        self.layer.shadowRadius  = 8
        self.layer.shadowOpacity = 0.5
        self.clipsToBounds       = true
        self.layer.masksToBounds = false
    }
}
