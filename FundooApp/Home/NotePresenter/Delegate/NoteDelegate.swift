//
//  NoteDelegate.swift
//  FundooApp
//
//  Created by admin on 04/06/20.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation

protocol NoteDelegate {
    func updateDataSource(fetchLimit: Int,fetchOffcet: Int)
    func updateDataSource() 
    func reorderCell(model:[Note],sourceIndexPath: IndexPath,destinationIndexPath: IndexPath)
    func getReminderNotes()-> [Note]
    func getArchiveNotes() -> [Note]
    func getTrashNotes() -> [Note]
    func saveNote()
    func deleteNote(note:Note)
}
