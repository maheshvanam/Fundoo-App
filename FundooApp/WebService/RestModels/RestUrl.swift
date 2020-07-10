//
//  RestUrl.swift
//  FundooApp
//
//  Created by admin on 07/07/20.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation

enum RestUrl  {
    private static let BASE_URL_PATH = "http://fundoonotes.incubation.bridgelabz.com/api/"
    static let ADD_NOTE_URL_PATH       = BASE_URL_PATH+"notes/addNotes"
    static let GET_ALL_NOTES_PATH      = BASE_URL_PATH+"notes/getNotesList"
    static let UPDATE_NOTES_PATH       = BASE_URL_PATH+"notes/updateNotes"
    static let SIGN_UP_URL_PATH        = BASE_URL_PATH+"user/userSignup"
    static let LOGIN_URL_PATH          = BASE_URL_PATH+"user/login"
    static let ARCHIVE_NOTES_PATH      = BASE_URL_PATH+"notes/archiveNotes"
    static let GET_ARCHIVE_NOTES_PATH = BASE_URL_PATH+"notes/getArchiveNotesList"
    static let TRASH_NOTES_URL_PATH    = BASE_URL_PATH+"notes/trashNotes"
    static let GET_TRASH_NOTES_PATH    = BASE_URL_PATH+"notes/getTrashNotesList"
    static let DELETE_NOTE_PATH        = BASE_URL_PATH+"notes/deleteForeverNotes"
    static let GET_REMINDER_NOTES_PATH = BASE_URL_PATH+"notes/getReminderNotesList"
    static let ADD_REMINDER_PATH       = BASE_URL_PATH+"notes/addUpdateReminderNotes"
    static let DELETE_REMINDER_PATH    = BASE_URL_PATH+"notes/removeReminderNotes"
    static let CREATE_LABEL_URL_PATH = BASE_URL_PATH+"noteLabels"
    static let GET_LABEL_LIST_URL_PATH = BASE_URL_PATH+"noteLabels/getNoteLabelList"
    static let LABELS_URL_PATH = BASE_URL_PATH+"noteLabels/"
    static let NOTES_URL_PATH = BASE_URL_PATH+"notes/"
    static let DELETE_LABEL_PATH = "/deleteNoteLabel"
    static let UPDATE_LABEL_PATH = "/updateNoteLabel"
    static let ADD_LABEL_TO_NOTE = "/addLabelToNotes/"
    static let ADD_PATH = "/add"
    static let REMOVE_PATH = "/remove"
    static let GET_NOTES_BY_LABEL_PATH = BASE_URL_PATH+"notes/getNotesListByLabel/"
}

enum RestConstants {
    static let authId           = "AuthenticatID"
    static let uId              = "userID"
    static let jsonParsingError = "Error while parsing json"
    static let post             = "POST"
    static let contentTypeKey   = "Content-Type"
    static let contentTypeValue = "application/json"
    static let authKey          = "Authorization"
    static let accessTokenKey   = "access_token"
}
