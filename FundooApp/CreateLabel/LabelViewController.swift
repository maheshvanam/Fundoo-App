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
    var labels:[LabelResponse] = []
    @IBOutlet var tableview:UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.labelPresenter = LabelPresenter(delegate: self)
        reloadDataSource()
        let addLabelNib = UINib(nibName: addLabelCellReusableId, bundle: nil)
        tableview.register(addLabelNib, forCellReuseIdentifier: addLabelCellReusableId)
        let nib = UINib(nibName: labelCellReusableId, bundle: nil)
        tableview.register(nib, forCellReuseIdentifier: labelCellReusableId)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        reloadDataSource()
    }
    
    func reloadDataSource(){
  //      labels = self.labelPresenter.getLabels()
        tableview.reloadData()
    }
}

extension LabelViewController: LabelViewDelegate {
    
}
