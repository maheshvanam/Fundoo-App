//
//  NoteViewController+NotePresenterDelegate.swift
//  FundooApp
//
//  Created by admin on 04/06/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

extension NoteViewController: NoteViewDelegate {
    
    func updateView(){
        print("collectionView reloaded with items ", models.count)
       // layout.reloadData()
        //collectionView.reloadData()
    }
    
    func setTableData(data: [Note]) {
        print("elements appended ",data.count)
        self.models.append(contentsOf: data)
        fetchCell = self.models.count
        print(models.count)
        layout.reloadData()
        collectionView.reloadData()
    }
    
    func addNotificationObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(toggleView), name: Notification.Name(Constants.TOGGLE_GRID), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(reloadCells), name: Notification.Name(Constants.RELOAD_CELLS), object: nil)
    }
}
