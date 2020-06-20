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
        if isNewLabel {
            return 1
        }
        return currentDataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if isNewLabel {
            let cell = labelTableView.dequeueReusableCell(withIdentifier: createLabelReusableCellId, for: indexPath) as! CreateLabelCell
            cell.createLabelField.text = self.searchTerm
            return cell
        }
        let cell = labelTableView.dequeueReusableCell(withIdentifier: reusableCellId, for: indexPath) as! CheckMarkCell
        cell.labelTitle.text = currentDataSource[indexPath.row]
        cell.selectionStyle = .none
        cell.checkMarkButton.addTarget(self, action: #selector(onCheckMarkClicked(sender:)), for: .touchUpInside)
        cell.layer.borderWidth = 1
        cell.layer.borderColor = UIColor.gray.cgColor
        return cell
    }
    
    @objc func onCheckMarkClicked(sender:UIButton) {
        sender.isSelected = sender.isSelected ? false : true
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return rowHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
}
