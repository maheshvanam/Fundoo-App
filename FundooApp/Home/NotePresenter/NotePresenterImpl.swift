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
        let coreData = CoreDataService()
        let email = UserDefaults.standard.string(forKey: Constants.EMAIL_KEY)
        do{
            let user = try coreData.getUser(email: email!)
            let notes = user.notes
            let allNotes = (notes!.allObjects as! [Note]).sorted(by: { $0.creationTime! > $1.creationTime!})
            self.noteView.setTableData(data:allNotes)
            self.noteView.updateView()
        }
        catch{
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
    }
}
