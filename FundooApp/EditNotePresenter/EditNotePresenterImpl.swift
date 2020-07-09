//
//  EditNotePresenterImpl.swift
//  FundooApp
//
//  Created by admin on 10/06/20.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation
class EditNotePresenterImpl: EditNoteDelegate {
    
    var editNoteView: EditNotePresenterDelegate
    let dbManager = RemoteNoteManager.shared
    
    init(delegate: EditNotePresenterDelegate) {
        self.editNoteView = delegate
    }
     
    func saveNote() {
        var note = editNoteView.getNote()
        if !editNoteView.fieldsAreEmpty() {
            if editNoteView.isNewNote() {
                note = NoteResponse()
                note!.createdDate = Date().toString()
                note!.title = editNoteView.getTitleText()
                note!.color = editNoteView.getCurrentColor()!
                note!.description = editNoteView.getDiscriptionText()
                dbManager.insertUserNote(note:note!)
                editNoteView.postReloadCellsNotification()
                    return
            }
            note!.title = editNoteView.getTitleText()
            note!.description = editNoteView.getDiscriptionText()
            }
        else{
            return
        }
        note!.modifiedDate = Date().toString()
        dbManager.updateNote(note:note!)
        editNoteView.postReloadCellsNotification()
    }
    
    func addToArchive(note:NoteResponse) {
        dbManager.addToArchive(note: note)
    }
    
    func addNoteToLabels(note:Note,labels: [Label]) {
//        let user = dbManager.getCurrentUser()
//        for label in labels {
//            label.addToNotes(note)
//            user.addToLabels(label)
//            dbManager.saveData()
//        }
    }
}
