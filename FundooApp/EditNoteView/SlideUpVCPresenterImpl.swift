//
//  SlideUpVCPresenterImpl.swift
//  FundooApp
//
//  Created by admin on 12/06/20.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation

class SlideUpVCPresenterImpl: SlideUpVCDelegate {
    
    func deleteNote(note: FundooNote) {
        note.isDeleted = !note.isDeleted
    }
}
