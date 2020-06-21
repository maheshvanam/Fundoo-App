//
//  CreateLabelViewController.swift
//  FundooApp
//
//  Created by admin on 21/06/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

let labelCellReusableId = "labelCell"

class LabelViewController: UIViewController {
    
    var labelPresenter: LabelPresenterDelegate!
    var labels:[Label] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.labelPresenter = LabelPresenter(delegate: self)
        labels = self.labelPresenter.getLabels()
    }
}

extension LabelViewController: LabelViewDelegate {
    
}
