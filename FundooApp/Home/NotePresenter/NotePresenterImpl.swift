//
//  NotePresenterImpl.swift
//  FundooApp
//
//  Created by admin on 04/06/20.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation

class NotePresenterImpl: NoteDelegate {
    
    var noteView: NotePresenterDelegate
    
    init(delegate: NotePresenterDelegate) {
        self.noteView = delegate
    }
    
    func updateCells() {
         self.noteView.updateView()
    }
    
    func updateDataSource(fetchLimit fecthLimit:Int,fetchOffcet:Int) {
        let dbManger = DatabaseManager()
        let allNotes = dbManger.getNotesFromDB(fetchLimit: fecthLimit, fetchOffSet: fetchOffcet)
        self.noteView.setTableData(data:allNotes)
        self.noteView.updateView()
    }

    func reorderCell(model: [Note], sourceIndexPath: IndexPath, destinationIndexPath: IndexPath) {
        var models: [Note] = []
        if sourceIndexPath.item <
            destinationIndexPath.item {
            for index in sourceIndexPath.item ... destinationIndexPath.item {
                models.append(model[index])
            }
            var pos = models[0].position
            for index in 1 ..< models.count {
                let t = models[index].position
                models[index].position = pos
                pos = t
            }
            models[0].position = pos
        }
        else
        {
            for index in destinationIndexPath.item ... sourceIndexPath.item {
                models.append(model[index])
            }
            var pos = models[models.count-1].position
            for index in (0 ..< models.count).reversed() {
                let t = models[index].position
                models[index].position = pos
                pos = t
            }
            models[models.count-1].position = pos
        }
        let dbManager = DatabaseManager()
        let user = dbManager.getCurrentUser()
        user.notes?.addingObjects(from: models)
        dbManager.saveUser(user: user)
    }
}
