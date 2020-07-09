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
            self.dbManager.getAllNotes(urlPath:RestUrl.GET_ALL_NOTES_PATH) { (noteModels) in
                print(noteModels.count  )
                let notes = noteModels.filter({ ($0.isArchived == false) && ($0.isDeleted == false) })
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
    
    func getReminderNotes(){
        DispatchQueue.main.async {
            self.dbManager.getAllNotes(urlPath: RestUrl.GET_REMINDER_NOTES_PATH) { (noteModels) in
                self.noteView.setTableData(data: noteModels)
                self.noteView.updateView()
            }
        }
    }
    
    func getArchiveNotes() {
        DispatchQueue.main.async {
            self.dbManager.getAllNotes(urlPath: RestUrl.GET_ARCHIVE_NOTES_PATH) { (noteModels) in
                self.noteView.setTableData(data: noteModels)
                self.noteView.updateView()
            }
        }
    }
    
    func getTrashNotes()  {
        DispatchQueue.main.async {
            self.dbManager.getAllNotes(urlPath: RestUrl.GET_TRASH_NOTES_PATH) { (noteModels) in
                self.noteView.setTableData(data: noteModels)
                self.noteView.updateView()
            }
        }
    }
    
    func restoreFromTrash(note:NoteResponse) {
        dbManager.addToTrash(note: note)
        getTrashNotes()
    }
    
    func deleteNote(note:NoteResponse){
        dbManager.deleteNoteForever(note: note)
        getTrashNotes()
    }
}
