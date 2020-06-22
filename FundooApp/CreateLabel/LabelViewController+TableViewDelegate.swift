//
//  LabelViewController+TableViewDelegate.swift
//  FundooApp
//
//  Created by admin on 22/06/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

extension LabelViewController: UITableViewDataSource,UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return labels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: labelCellReusableId, for: indexPath) as! LabelCell
        cell.labelTitle.text = labels[indexPath.row].title
        cell.labelDelete.tag = indexPath.row
        cell.labelDelete.addTarget(self, action: #selector(onDeletePressed(sender: )), for: .touchUpInside)
        cell.layer.borderWidth = cellBorderWidth
        cell.layer.borderColor = UIColor.gray.cgColor
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let notes = labels[indexPath.row].notes?.allObjects as! [Note]
        let board = UIStoryboard(name: Constants.HOME_STORYBOARD, bundle: nil)
        guard let childVC = board.instantiateViewController(withIdentifier: resultViewControllerId ) as? SearchResultVC  else {
            return
        }
        childVC.dataSource = notes
        navigationController?.pushViewController(childVC, animated: true)
    }
    
    @objc func onDeletePressed(sender:UIButton){
        let index = sender.tag
        let label = labels[index]
        labelPresenter.deleteNote(label: label)
        reloadDataSource()
        tableview.reloadData()
    }
}
