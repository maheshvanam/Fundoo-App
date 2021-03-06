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
        items = currentLabels.map { SelectableItem(item: $0) }
        return currentLabels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if isNewLabel {
            let cell = labelTableView.dequeueReusableCell(withIdentifier: createLabelReusableCellId, for: indexPath) as! CreateLabelCell
            cell.createLabelField.text = "Create \"\(self.searchTerm)\""
            cell.layer.borderWidth = 1
            cell.layer.borderColor = UIColor.gray.cgColor
            return cell
        }
        let cell = labelTableView.dequeueReusableCell(withIdentifier: reusableCellId, for: indexPath) as! CheckMarkCell
        cell.labelTitle.text = currentLabels[indexPath.row].label
        cell.selectionStyle = .blue
        Helper.setCellBorder(cell: cell)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return rowHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if isNewLabel {
            let uid = UserDefaults.standard.string(forKey: RestConstants.uId)
            let label = LabelResponse(label: self.searchTerm, isDeleted: false, userId: uid! )
            self.addLabelPresenter.createLabel(label: label)
            isNewLabel = false
            self.loadLabels()
        }
        else{
            let cell = tableView.cellForRow(at: indexPath) as! CheckMarkCell
            cell.checkMarkButton.isSelected = !cell.checkMarkButton.isSelected
            if cell.checkMarkButton.isSelected {
                self.items[indexPath.row].isSelected = true
            }
            else
            {
                self.items[indexPath.row].isSelected = false
            }
        }
    }
}
