//
//  NoteCellPresenter.swift
//  FundooApp
//
//  Created by admin on 11/07/20.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation


protocol NoteCellDelegate {
    func removeLabelFromNote(label:LabelResponse,note:NoteResponse)
}

class NoteCellPresenter:NoteCellDelegate {
    
    let labelManager = RemoteLabelManager.shared
    func removeLabelFromNote(label: LabelResponse, note: NoteResponse) {
        labelManager.removeLabelFromNote(note:note,label:label)
    }
}
