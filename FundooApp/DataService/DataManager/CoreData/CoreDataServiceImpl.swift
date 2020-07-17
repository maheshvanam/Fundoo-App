//
//  PersistenceService.swift
//  FundooApp
//
//  Created by admin on 25/05/20.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation
import UIKit
import CoreData

private let noteEntity     = "Note"
private let userEntity     = "User"
private let ownerPredicate = "owner = %@"
private let emailPredicate = "email = %@"

class CoreDataServiceImpl  {
  
    static let shared = CoreDataServiceImpl()
    
    private let appDelegate = UIApplication.shared.delegate as! AppDelegate
    private let context = ( UIApplication.shared.delegate as! AppDelegate ).persistentContainer.viewContext
    private let fetchRequest = NSFetchRequest<User>(entityName: userEntity)
    
    func insertUser(registartionUser: UserModel) {
        let  user = User(context: context)
        user.firstName=registartionUser.firstName
        user.lastName=registartionUser.lastName
        user.email=registartionUser.email
        user.password=registartionUser.password
        appDelegate.saveContext()
    }
    
    func checkValidUserOrNot(email: String,password: String)  -> ResultType {
        let predicate = NSPredicate(format: emailPredicate, email)
        self.fetchRequest.predicate = predicate
        do {
            let result = try context.fetch(self.fetchRequest) as NSArray
            if result.count > 0 {
                let userEntity = result.firstObject as! User
                if(userEntity.email == email && userEntity.password == password) {
                    return ResultType.SUCCESS
                }
                else {
                    return ResultType.INVALID_PASSWORD
                }
            }
            else{
                return ResultType.INVALID_EMAIL
            }
        }
        catch{
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.description)")
        }
    }

    func getUser(email: String) throws ->  User {
        var user:User!
        fetchRequest.predicate = NSPredicate(format: emailPredicate, email )
        do{
            let result = try context.fetch( fetchRequest ) as NSArray
            if result.count > 0 {
                user = (result.firstObject as! User)
            }
            else{
                throw CoreDataError.UserNotFound
            }
        }
        catch{
            let nserror = error as NSError
            fatalError("\(nserror), \(nserror.description)")
        }
        return user
    }

    
    func deleteUser(email: String) {
        let predicate = NSPredicate(format: emailPredicate, email)
        fetchRequest.predicate = predicate
        do{
            let result = try context.fetch(fetchRequest) as NSArray
            let userEntity = result.firstObject as! User
            context.delete(userEntity)
        }
        catch{
            let nserror = error as NSError
            fatalError("\(nserror), \(nserror.description)")
        }
    }
    
    func insertNote(note: Note) {
        let email = UserDefaults.standard.string(forKey: Constants.EMAIL_KEY)
        do{
            let user = try getUser(email: email!)
            user.addToNotes(note)
            try context.save()
        }
        catch{
            let nserror = error as NSError
            fatalError(" \(nserror), \(nserror.description)")
        }
    }
    
    func createNote() -> Note {
       return Note(context: context)
    }
    
    func deleteNote(note: Note) {
        note.trash = !note.trash
//        do{
//            let user = try getUser(email: UserDefaults.standard.string(forKey: Constants.EMAIL_KEY)!)
//            user.removeFromNotes(note)
//            try context.save()
//        }
//        catch CoreDataError.UserNotFound {
//            fatalError(Constants.USER_NOT_FOUND);
//        }
//        catch {
//            fatalError(Constants.FETCH_ERROR);
//        }
    }
    
    func getCurrentUser() -> User {
        var user:User!
        do{
         let email =   UserDefaults.standard.string(forKey: Constants.EMAIL_KEY)!
         user = try getUser(email:email)
        }
        catch CoreDataError.UserNotFound {
            fatalError(Constants.USER_NOT_FOUND);
        }
        catch {
            fatalError(Constants.FETCH_ERROR);
        }
        return user
    }

    func saveUser(user: User) {
        do {
        try context.save()
        }
        catch {
            fatalError(Constants.FETCH_ERROR);
        }
    }
    
//    func getNotesFromDB(fetchLimit:Int, fetchOffSet:Int) -> [Note] {
//        var records = [Note]()
//        let fetchRequest = NSFetchRequest<Note>(entityName: noteEntity)
//        let predicate = NSPredicate(format: ownerPredicate, getCurrentUser())
//        fetchRequest.predicate = predicate
//        fetchRequest.fetchOffset = fetchOffSet
//        fetchRequest.fetchLimit = fetchLimit
//        do {
//        records = try self.context.fetch(fetchRequest)
//        }
//        catch CoreDataError.dataNotFound {
//            fatalError(Constants.DATA_ERROR);
//        }
//        catch {
//            fatalError(Constants.FETCH_ERROR);
//        }
//        return records
//    }
    
    func createLabel() -> Label {
        let label  = Label(context: context)
   //     label.user = getCurrentUser()
      return label
    }
    
    func saveData() {
        do {
            try context.save()
        }
        catch CoreDataError.saveError {
            fatalError(Constants.DATA_ERROR);
        }
        catch {
            fatalError(Constants.FETCH_ERROR);
        }
    }
}

