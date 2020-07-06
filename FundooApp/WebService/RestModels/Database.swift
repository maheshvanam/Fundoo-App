//
//  Database.swift
//  FundooApp
//
//  Created by admin on 06/07/20.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation
class Database {
    var notes:[FundooNote]!
    static let shared = Database()
    init() {
        notes = []
        notes.append(FundooNote(title:"1",description:"1 description"))
        notes.append(FundooNote(title:"2",description:"2 description"))
        notes.append(FundooNote(title:"3",description:"3 description"))
        notes.append(FundooNote(title:"4",description:"4 description"))
        notes.append(FundooNote(title:"5",description:"5 description"))
        notes.append(FundooNote(title:"6",description:"6 description"))
        notes.append(FundooNote(title:"7",description:"7 description"))
        notes.append(FundooNote(title:"8",description:"8 description"))
    }
    
}
