//
//  CoreDataService.swift
//  FundooApp
//
//  Created by admin on 29/05/20.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation
protocol DataService {
    func insertUser(registartionUser: UserModel)
    func insertNote(title: String ,note: String)
    func getAllNotes() -> NSArray?
    func checkValidUserOrNot(email: String,password: String) -> Result
    func deleteUser(email: String)
    func deleteNote(title: String)
    func UpdateNote(note: Note)
    func createNote() -> Note
}
