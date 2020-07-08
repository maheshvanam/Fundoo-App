//
//  RestUrl.swift
//  FundooApp
//
//  Created by admin on 07/07/20.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation

struct RestUrl  {
    static let baseUrl = "http://fundoonotes.incubation.bridgelabz.com/api/"
    static let addNotesUrl      = baseUrl+"notes/addNotes"
    static let getNotesListUrl  = baseUrl+"notes/getNotesList"
    static let updateNotesUrl   = baseUrl+"notes/updateNotes"
    static let userSignupUrl    = baseUrl+"user/userSignup"
    static let loginUrl         = baseUrl+"user/login"
}

struct RestConstants {
    static let authId           = "AuthenticatID"
    static let jsonParsingError = "Error while parsing json"
    static let post             = "POST"
    static let contentTypeKey   = "Content-Type"
    static let contentTypeValue = "application/json"
}
