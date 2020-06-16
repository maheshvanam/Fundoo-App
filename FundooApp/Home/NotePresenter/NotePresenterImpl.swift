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
    
    func updateTableData() {
        let coreData = DatabaseManager()
        let email = UserDefaults.standard.string(forKey: Constants.EMAIL_KEY)
        do{
            let user = try coreData.getUser(email: email!)
            let notes = user.notes
            let allNotes = (notes!.allObjects as! [Note]).sorted(by: { $0.position > $1.position})
            //let allNotes = notes?.allObjects as! [Note]
            self.noteView.setTableData(data:allNotes)
            self.noteView.updateView()
        }
        catch{
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
    }
    
    func updateReorderData(sourceNote:Note,destinationNote:Note){
            let temp = sourceNote.position
            sourceNote.position = destinationNote.position
            destinationNote.position = temp
            let dbManager = DatabaseManager()
            dbManager.insertNote(note: sourceNote)
            dbManager.insertNote(note: destinationNote)
       }
    
    func reorderCell(model: [Note], sourceIndexPath: IndexPath, destinationIndexPath: IndexPath) {
        var models = model
        let sourcePosition = models[sourceIndexPath.item].position
        let destinationPosition = models[destinationIndexPath.item].position
        if sourcePosition < destinationPosition {
            let firstNote = models[ sourceIndexPath.item ]
            for index in sourceIndexPath.item ..< destinationIndexPath.item {
                let note = models[index+1]
                note.position = note.position + 1
                models.insert(note, at: index)
            }
            firstNote.position = models[destinationIndexPath.item].position
            models.insert(firstNote, at: destinationIndexPath.item)
        }
        
        let dbManager = DatabaseManager()
        let user = dbManager.getCurrentUser()
        user.notes?.addingObjects(from: models)
        dbManager.saveUser(user: user)
    }
}
