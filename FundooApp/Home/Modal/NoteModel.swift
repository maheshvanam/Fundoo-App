//
//  NoteModel.swift
//  FundooApp
//
//  Created by admin on 05/06/20.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation

class NoteModel {
    var title:String?
    var note:String?
    var user: UserModel?
       
    init(noteModel: Note) {
       self.title = noteModel.title
       self.note = noteModel.note
       self.user = UserModel(userModel: noteModel.owner!)
    }
}
