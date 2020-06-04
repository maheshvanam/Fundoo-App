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
        if let notes = coreData.getAllNotes() {
            let allNotes = notes as! [Note]
            var data: [NoteModel] = []
            for note in allNotes{
                data.append(NoteModel(noteModel: note))
            }
            self.noteView.updateView()
            self.noteView.setTableData(data:data)
        }
    }
}
