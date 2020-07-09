//
//  RestUrl.swift
//  FundooApp
//
//  Created by admin on 07/07/20.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation

enum RestUrl  {
    private static let baseUrl = "http://fundoonotes.incubation.bridgelabz.com/api/"
    static let ADD_NOTE_URL_PATH      = baseUrl+"notes/addNotes"
    static let getNotesListUrl  = baseUrl+"notes/getNotesList"
    static let updateNotesUrl   = baseUrl+"notes/updateNotes"
    static let userSignupUrl    = baseUrl+"user/userSignup"
    static let loginUrl         = baseUrl+"user/login"
    static let ARCHIVE_NOTES_PATH = baseUrl+"notes/archiveNotes"
    static let GET_ARCHIVE_NOTES_PATH = baseUrl+"notes/getArchiveNotesList"
}

enum RestConstants {
    static let authId           = "AuthenticatID"
    static let jsonParsingError = "Error while parsing json"
    static let post             = "POST"
    static let contentTypeKey   = "Content-Type"
    static let contentTypeValue = "application/json"
    static let authKey          = "Authorization"
    static let accessTokenKey   = "access_token"
}
