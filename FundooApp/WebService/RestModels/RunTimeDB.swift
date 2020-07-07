//
//  Database.swift
//  FundooApp
//
//  Created by admin on 06/07/20.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation
class RunTimeDB {
    var notes:[NoteResponse]!
    var user:UserResponse!
    static let shared = RunTimeDB()
    init() {
        notes = []
        notes.append(NoteResponse(title:"1",description:"1 description"))
        notes.append(NoteResponse(title:"2",description:"2 description"))
        notes.append(NoteResponse(title:"3",description:"3 description"))
        notes.append(NoteResponse(title:"4",description:"4 description"))
        notes.append(NoteResponse(title:"5",description:"5 description"))
        notes.append(NoteResponse(title:"6",description:"6 description"))
        notes.append(NoteResponse(title:"7",description:"7 description"))
        notes.append(NoteResponse(title:"8",description:"8 description"))
    }
    
    func setUser(user:UserResponse) {
        self.user = user
    }
}
