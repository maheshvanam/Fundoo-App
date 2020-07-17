//
//  NoteModel.swift
//  FundooApp
//
//  Created by admin on 01/07/20.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation
class NoteDataModel {
    var title:String!
    var description:String!
    var id:String!
    func setNoteId(id:String){
        self.id = id
    }
    func toDictionary() ->[String:String] {
        return ["title":title,"description":description,"id":id]
    }
}
