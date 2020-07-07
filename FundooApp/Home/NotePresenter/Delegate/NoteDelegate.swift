//
//  NoteDelegate.swift
//  FundooApp
//
//  Created by admin on 04/06/20.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation

protocol NoteDelegate {
    func updateDataSource()
    func reorderCell(model:[Note],sourceIndexPath: IndexPath,destinationIndexPath: IndexPath)
    func getReminderNotes()-> [NoteResponse]
    func getArchiveNotes() -> [NoteResponse] 
    func getTrashNotes() -> [NoteResponse] 
//    func deleteNote(note:Note)
}
