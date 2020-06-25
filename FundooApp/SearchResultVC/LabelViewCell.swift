//
//  LabelViewCell.swift
//  FundooApp
//
//  Created by admin on 25/06/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class LabelViewCell: UICollectionViewCell {

    @IBOutlet weak var labelField: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.borderColor = UIColor.gray.cgColor
        self.layer.borderWidth = 0.5
        self.layer.cornerRadius = 14
    }
}
