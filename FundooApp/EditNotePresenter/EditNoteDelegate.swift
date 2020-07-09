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
    func addNoteToLabels(note:Note,labels: [Label])
    func addToArchive(note:NoteResponse)
}
