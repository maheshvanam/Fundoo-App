//
//  SideMenuPresenter.swift
//  FundooApp
//
//  Created by admin on 25/06/20.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation

class SideMenuPresenter:SideMenuPresenterDelegate {
    
    let dbManager = DatabaseManager()
    
    func getArchiveNotes() -> [Note] {
        let user = dbManager.getCurrentUser()
        let notes = user.notes?.allObjects as! [Note]
        return notes.filter({ $0.archive == true })
    }
    
    func getTrashNotes() -> [Note] {
        let user = dbManager.getCurrentUser()
        let notes = user.notes?.allObjects as! [Note]
        return notes.filter({ $0.trash == true })
    }
}
