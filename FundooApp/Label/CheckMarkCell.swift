//
//  CheckMarkCell.swift
//  FundooApp
//
//  Created by admin on 17/06/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class CheckMarkCell: UITableViewCell {
    
    @IBOutlet var labelTitle:UILabel!
    @IBOutlet var checkMarkButton:UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
