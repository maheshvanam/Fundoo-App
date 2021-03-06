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
        layout.reloadData()
        collectionView.reloadData()
    }
    
    func setTableData(data: [NoteResponse]) {
        self.models = data
    }
    
    func addNotificationObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(toggleView), name: Notification.Name(Constants.TOGGLE_GRID), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(reloadCells), name: Notification.Name(Constants.RELOAD_CELLS), object: nil)
    }
    
    func getNotes() ->[NoteResponse]{
        return models
    }
}
