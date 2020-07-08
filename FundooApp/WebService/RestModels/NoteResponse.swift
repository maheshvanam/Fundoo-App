//
//  FundooNote.swift
//  FundooApp
//
//  Created by admin on 05/07/20.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation

class NoteResponse:Codable {
    
    var title:String?
    var description:String?
    var isPined:Bool?
    var isArchived:Bool?
    var isDeleted:Bool?
    var reminder: [String]?
    var createdDate: String?
    var modifiedDate: String?
    var color: String?
    var label:[String]?
    var typeOfNotes:String?
    var imageUrl:String?
    var linkUrl:String?
    var id:String?
    var user: UserResponse?
    var userId:String?
    
    init() {
        
    }
    
    init(title:String,description:String) {
        self.title = title
        self.description = description
    }
}
