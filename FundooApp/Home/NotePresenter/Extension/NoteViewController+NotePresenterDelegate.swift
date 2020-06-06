//
//  NoteViewController+NotePresenterDelegate.swift
//  FundooApp
//
//  Created by admin on 04/06/20.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation

extension NoteViewController: NotePresenterDelegate {
    
    func updateView(){
    }
    
    func setTableData(data: [NoteModel]) {
        self.models = []
        self.models = data
    //    self.table.reloadData()
    }
}
