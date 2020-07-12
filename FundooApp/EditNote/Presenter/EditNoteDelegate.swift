//
//  EditNoteDelegate.swift
//  FundooApp
//
//  Created by admin on 10/06/20.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation
protocol EditNoteDelegate {
    func saveNote()
    func addNoteToLabels(note:NoteResponse,labels: [LabelResponse])
    func addToArchive(note:NoteResponse)
    func addReminder(note:NoteResponse)
    func deleteReminder(note:NoteResponse)
}
