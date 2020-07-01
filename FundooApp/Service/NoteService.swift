//
//  NoteService.swift
//  FundooApp
//
//  Created by admin on 01/07/20.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation

protocol NoteService {
    
    func insertUserNote(note:NoteModel)
    func getAllNotes() -> [NoteModel] 
}
