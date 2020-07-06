//
//  NoteModel.swift
//  FundooApp
//
//  Created by admin on 05/06/20.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation

public class NoteModel: Codable {
    
    var title:String?
    var description:String?
    var isArchive: Bool = false
    var color: String = "white"
    var creationTime: Date?
    var editTime: Date?
    var isPinned: Bool = false
    var position: Int64?
    var reminder: Date?
    var isTrash: Bool = false
    var id:String?
}
