//
//  LabelViewController+TableViewDelegate.swift
//  FundooApp
//
//  Created by admin on 22/06/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit
let addLabelCellReusableId = "AddLabelCell"
extension LabelViewController: UITableViewDataSource,UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return labels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: addLabelCellReusableId, for: indexPath) as! AddLabelCell
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: labelCellReusableId, for: indexPath) as! LabelCell
        cell.labelTitle.text = labels[indexPath.row].title
        cell.labelDelete.tag = indexPath.row
        cell.labelDelete.addTarget(self, action: #selector(onDeletePressed(sender: )), for: .touchUpInside)
        cell.layer.borderWidth = cellBorderWidth
        cell.layer.borderColor = UIColor.gray.cgColor
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
            let label = labels[indexPath.row]
            
            let board = UIStoryboard(name: Constants.FEATURES_STORYBOARD, bundle: nil)
            guard let childVC = board.instantiateViewController(withIdentifier: Constants.UPDATE_LABEL_VC ) as? UpdateLabelViewController  else {
                return
            }
            if indexPath.section != 0 {
                childVC.label = label
            }
            navigationController?.pushViewController(childVC, animated: true)
    }
    
    @objc func onDeletePressed(sender:UIButton){
        let index = sender.tag
        let label = labels[index]
        labelPresenter.deleteLabel(label: label)
        reloadDataSource()
        tableview.reloadData()
    }
    
    @objc func saveLabel(){
        
    }
}
