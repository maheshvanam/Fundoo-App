//
//  AddLabelViewController+TableView.swift
//  FundooApp
//
//  Created by admin on 18/06/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

extension AddLabelViewController: UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = labelTableView.dequeueReusableCell(withIdentifier: ReusableCellId, for: indexPath) as! CheckMarkCell
        cell.labelTitle.text = dataSource[indexPath.row]
        cell.selectionStyle = .none
        cell.checkMarkButton.addTarget(self, action: #selector(onCheckMarkClicked(sender:)), for: .touchUpInside)
        
        return cell
    }
    
    @objc func onCheckMarkClicked(sender:UIButton) {
        sender.isSelected = sender.isSelected ? false : true
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return rowHeight
    }
}
