//
//  RemoteNoteService.swift
//  FundooApp
//
//  Created by admin on 08/07/20.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation

protocol RemoteNoteService {
    func getAllNotes( urlPath:String,callback: @escaping([NoteResponse])-> Void)
    func insertUserNote(note:NoteResponse)
    func updateNote(note:NoteResponse)
    func addToArchive(note: NoteResponse)
    func addToTrash(note: NoteResponse)
}
