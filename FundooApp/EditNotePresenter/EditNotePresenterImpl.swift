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
    let labelManager = RemoteLabelManager.shared
    
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
    
    func addNoteToLabels(note:NoteResponse,labels: [LabelResponse]) {
        for label in labels {
            labelManager.addLabelToNote(note: note, label: label)
        }
    }
    
    func addReminder(note:NoteResponse) {
        let reminder = note.reminder
        let params = ["reminder":reminder,"noteIdList": [note.id]] as [String:Any]
        dbManager.postRequest(params: params, urlPath: RestUrl.ADD_REMINDER_PATH)
    }
    
    func deleteReminder(note:NoteResponse) {
        dbManager.postRequest(params: ["noteIdList": [note.id]], urlPath: RestUrl.DELETE_REMINDER_PATH)
    }
}
