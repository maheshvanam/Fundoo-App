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
        var models: [Note] = []
       print(sourceIndexPath.item," ",destinationIndexPath.item)
        for i in sourceIndexPath.item ... destinationIndexPath.item {
            models.append(model[i])
            print("&&&&&& ",model[i].position)
        }
    
        var pos = models[0].position
        for i in 1 ..< models.count {
            let t = models[i].position
            models[i].position = pos
            pos = t
             print(models[i].position,"<-",models[i-1].position)
        }
        models[0].position = pos
        let dbManager = DatabaseManager()
        let user = dbManager.getCurrentUser()
        user.notes?.addingObjects(from: models)
        dbManager.saveUser(user: user)
    }
}
