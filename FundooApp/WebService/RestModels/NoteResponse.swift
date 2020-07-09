//
//  FundooNote.swift
//  FundooApp
//
//  Created by admin on 05/07/20.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation

class NoteResponse:Codable {
    
    var title:String = ""
    var description:String = ""
    var isPined:Bool = false
    var isArchived:Bool = false
    var isDeleted:Bool = false
    var reminder: [String] = []
    var createdDate: String = Date().toString()
    var modifiedDate: String = Date().toString()
    var color: String = "#FFFFFF"
    var label:[String]?
    var typeOfNotes:String?
    var imageUrl:String?
    var linkUrl:String?
    var id:String = ""
    var user: UserResponse?
    var userId:String?
    
    init() {
       //default
    }
    
    init(title:String,description:String) {
        self.title = title
        self.description = description
    }
}
