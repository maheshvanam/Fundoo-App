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
    var isPined:Bool = false
    var isArchived:Bool = false
    var isDeleted:Bool = false
    var reminder: [String]?
    var createdDate: String?
    var modifiedDate: String?
    var color: String = "white"
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
    
    var asDictionary : [String:Any] {
      let mirror = Mirror(reflecting: self)
      let dict = Dictionary(uniqueKeysWithValues: mirror.children.lazy.map({ (label:String?, value:Any) -> (String, Any)? in
        guard let label = label else { return nil }
        return (label, value)}).compactMap { $0 })
      return dict
    }
}
