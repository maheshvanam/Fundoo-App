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
    
    init(delegate: EditNotePresenterDelegate) {
        self.editNoteView = delegate
    }
          
    func saveNote() {
        let coreData = DatabaseManager()
        var note = editNoteView.getNote()
        if editNoteView.fieldsAreEmpty() {
            if editNoteView.isNewNote() {
                print("dsd")
                note = coreData.createNote()
                note!.creationTime = Date()
                note!.title = editNoteView.getTitleText()
                note!.color = editNoteView.getCurrentColor()
                note!.note = editNoteView.getDiscriptionText()
                let user = coreData.getCurrentUser()
                let count = (user.notes  == nil) ? 0 : user.notes?.count
                note!.position =  Int64(count! + 1)
                coreData.insertNote(note: note!)
                editNoteView.postReloadCellsNotification()
                    return
            }
            note!.title = editNoteView.getTitleText()
            note!.note = editNoteView.getDiscriptionText()
        }
        else{
            return
        }
        note!.editTime = Date()
        coreData.insertNote(note: note!)
        editNoteView.postReloadCellsNotification()
    }
}
