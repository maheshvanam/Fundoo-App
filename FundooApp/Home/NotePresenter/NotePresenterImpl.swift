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
    let dbManager = DatabaseManager()
    
    init(delegate: NoteViewDelegate) {
        self.noteView = delegate
    }
    
    
    func updateDataSource() {
        let coreData = DatabaseManager()
        let email = UserDefaults.standard.string(forKey: Constants.EMAIL_KEY)
        do{
            let user = try coreData.getUser(email: email!)
            let notes = user.notes
            let allNotes = (notes!.allObjects as! [Note]).sorted(by: { $0.position > $1.position})
            //let allNotes = notes?.allObjects as! [Note]
            self.noteView.setTableData(data:allNotes.filter({$0.archive == false && $0.trash == false }))
            self.noteView.updateView()
        }
        catch{
            let nserror = error as NSError
            fatalError(" \(nserror.description)")
        }
    }
    
    func updateDataSource(fetchLimit fecthLimit:Int,fetchOffcet:Int) {
        let dbManger = DatabaseManager()
        let allNotes = dbManger.getNotesFromDB(fetchLimit: fecthLimit, fetchOffSet: fetchOffcet)
        if allNotes.count != 0 {
            self.noteView.setTableData(data:allNotes)
            //.sorted(by: {$0.position > $1.position}))
        }
        else {
            fetchCell = 0
        }
        //self.noteView.updateView()
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
        let user = dbManager.getCurrentUser()
        user.notes?.addingObjects(from: models)
        dbManager.saveUser(user: user)
    }
    
    func getReminderNotes()-> [Note] {
        let user = dbManager.getCurrentUser()
        let notes = user.notes?.allObjects as! [Note]
        return notes.filter({$0.reminder != nil})
    }
    
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
    func saveNote() {
        dbManager.saveData()
    }
    func deleteNote(note:Note){
        let user = dbManager.getCurrentUser()
        user.removeFromNotes(note)
        let labels = user.labels?.allObjects as! [Label]
        for label in labels {
            label.removeFromNotes(note)
        }
        dbManager.saveData()
    }
    
}
