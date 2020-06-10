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
        let coreData = CoreDataService()
        var note = editNoteView.getNote()
        if editNoteView.fieldsAreEmpty() {
            if editNoteView.isNewNote() {
                note = coreData.createNote()
                note!.creationTime = Date()
                note!.title = editNoteView.getTitleText()
                note!.color = editNoteView.getCurrentColor()
                note!.note = editNoteView.getDiscriptionText()
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
