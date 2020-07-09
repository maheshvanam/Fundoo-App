//
//  SlideUpVCPresenterImpl.swift
//  FundooApp
//
//  Created by admin on 12/06/20.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation

class SlideUpVCPresenterImpl: SlideUpVCDelegate {
    let dbManager = RemoteNoteManager.shared
    func deleteNote(note: NoteResponse) {
        dbManager.addToTrash(note: note)
    }
}
