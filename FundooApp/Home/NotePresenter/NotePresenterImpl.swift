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
    
    func updateTableData() {
        let coreData = CoreDataService()
        let email = UserDefaults.standard.string(forKey: Constants.EMAIL_KEY)
       // var result: NSArray?
        do{
            let user = try coreData.getUser(email: email!)
            let notes = user.notes
            let allNotes = notes!.allObjects
            var data: [NoteModel] = []
            for note in allNotes{
                data.append(NoteModel(noteModel:  note as! Note ))
            }
            self.noteView.setTableData(data:data)
            self.noteView.updateView()
        }
        catch{
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
//        if let notes = coreData.getAllNotes() {
//            let allNotes = notes as! [Note]
//            var data: [NoteModel] = []
//            for note in allNotes{
//                data.append(NoteModel(noteModel: note))
//            }
//            self.noteView.setTableData(data:data)
//            self.noteView.updateView()
        
    }
}
