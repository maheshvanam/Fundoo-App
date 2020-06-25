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
    
    private let cornerRadius:CGFloat = 14
    private let borderWidth:CGFloat = 0.5
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.borderColor = UIColor.gray.cgColor
        self.layer.borderWidth = self.borderWidth
        self.layer.cornerRadius = self.cornerRadius
    }
}
