//
//  RestUrl.swift
//  FundooApp
//
//  Created by admin on 07/07/20.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation
enum RestUrl : String {
    case addNotes = "http://fundoonotes.incubation.bridgelabz.com/api/notes/addNotes"
    case getNotesList = "http://fundoonotes.incubation.bridgelabz.com/api/notes/getNotesList"
}

enum RestConstants:String {
    case authId = "AuthenticatID"
    case jsonParsingError = "Error while parsing json"
    
}
