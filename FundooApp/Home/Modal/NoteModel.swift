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
    var isArchive: Bool?
    var color: String?
    var creationTime: Date?
    var editTime: Date?
    var isPinned: Bool?
    var position: Int64?
    var reminder: Date?
    var isTrash: Bool?
    var id:String?
    
    enum CodingKeys: String, CodingKey {
        case title
        case description
        case isArchive
        case color
        case creationTime
        case editTime
        case isPinned
        case position
        case reminder
        case isTrash
        case id
    }
}
