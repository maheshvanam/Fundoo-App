//
//  CreateLabelViewController.swift
//  FundooApp
//
//  Created by admin on 21/06/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

let labelCellReusableId = "LabelCell"

class LabelViewController: UIViewController {
    
    var labelPresenter: LabelPresenterDelegate!
    var labels:[Label] = []
    @IBOutlet var tableview:UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.labelPresenter = LabelPresenter(delegate: self)
        reloadDataSource()
        let nib = UINib(nibName: labelCellReusableId, bundle: nil)
        tableview.register(nib, forCellReuseIdentifier: labelCellReusableId)
    }
    
    func reloadDataSource(){
        labels = self.labelPresenter.getLabels()
    }
}

extension LabelViewController: LabelViewDelegate {
    
}
