//
//  NotePresenterImpl.swift
//  FundooApp
//
//  Created by admin on 04/06/20.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation

class NotePresenterImpl: NoteDelegate {
    
    var noteView: NoteViewDelegate
    let dbManager = RemoteNoteManager.shared
    
    init(delegate: NoteViewDelegate) {
        self.noteView = delegate
    }
    
    func updateDataSource() {
        DispatchQueue.main.async {
            self.dbManager.getAllNotes { (noteModels) in
                let notes = noteModels.filter({ $0.isArchived == false })
                self.noteView.setTableData(data: notes)
                self.noteView.updateView()
            }
        }
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
                let t = models[index].position//
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
//        let user = dbManager.getCurrentUser()
//        user.notes?.addingObjects(from: models)
//        dbManager.saveUser(user: user)
    }
    
    func getReminderNotes()-> [NoteResponse] {
        self.updateDataSource()
        let notes = self.noteView.getNotes()
        return notes.filter({($0.reminder.count) > 0 })
    }
    
    func getArchiveNotes() {
        DispatchQueue.main.async {
            self.dbManager.getArchiveNotes { (noteModels) in
                self.noteView.setTableData(data: noteModels)
                self.noteView.updateView()
            }
        }
    }
    
    func getTrashNotes() -> [NoteResponse] {
        self.updateDataSource()
        let notes = self.noteView.getNotes()
        return notes.filter({ $0.isDeleted == true })
    }

    func deleteNote(note:NoteResponse){
//        let user = dbManager.getCurrentUser()
//        user.removeFromNotes(note)
//        let labels = user.labels?.allObjects as! [Label]
//        for label in labels {
//            label.removeFromNotes(note)
//        }
//        dbManager.saveData()
    }
    
}
