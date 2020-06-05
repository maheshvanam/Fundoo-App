//
//  AddNotePresenterImpl.swift
//  FundooApp
//
//  Created by admin on 05/06/20.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation

class AddNotePresenterImpl: AddNoteDelegate {

    var addNoteView: AddNotePresenterDelegate
   
    init(delegate: AddNotePresenterDelegate) {
        self.addNoteView = delegate
    }
    
    func insertNote(title:String, note:String) {
        let coreData = CoreDataService()
                   coreData.insertNote(title: title, note: note)
    }
}
