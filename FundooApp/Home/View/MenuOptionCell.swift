//
//  MenuOptionCellTableViewCell.swift
//  FundooApp
//
//  Created by admin on 01/06/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class MenuOptionCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .darkGray
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
