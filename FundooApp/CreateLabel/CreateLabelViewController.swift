//
//  CreateLabelViewController.swift
//  FundooApp
//
//  Created by admin on 21/06/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

let labelCellReusableId = "labelCell"

class CreateLabelViewController: UIViewController {
    
    var createLabelPresenter: CreateLabelPresenterDelegate!
    var labels:[Label] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.createLabelPresenter = CreateLabelPresenter(delegate: self)
        labels = self.createLabelPresenter.getLabels()
    }
    
    
    
}

extension CreateLabelViewController: UITableViewDataSource,UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return labels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: labelCellReusableId, for: indexPath)
        cell.layer.borderWidth = cellBorderWidth
        cell.layer.borderColor = UIColor.gray.cgColor
        cell.textLabel?.text = labels[indexPath.row].title  
        return cell
    }
}

extension CreateLabelViewController: CreateLabelViewDelegate {
    
}
