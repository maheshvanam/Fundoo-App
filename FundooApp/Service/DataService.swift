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
    func checkValidUserOrNot(email: String,password: String) -> Result
    func deleteUser(email: String)
    func insertNote(note: Note)
    func createNote() -> Note
    func deleteNote(note: Note)
    func getCurrentUser() -> User
    func getNotesFromDB(fetchLimit:Int, fetchOffSet:Int) -> [Note]
    func createLabel() -> Label
    func saveData()
}
