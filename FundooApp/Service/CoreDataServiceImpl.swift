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

class CoreDataServiceImpl : DataService {
    
    private let appDelegate = UIApplication.shared.delegate as! AppDelegate
    private let context = ( UIApplication.shared.delegate as! AppDelegate ).persistentContainer.viewContext
    private let fetchRequest = NSFetchRequest<User>(entityName: "User")
    
    func insertUser(registartionUser: UserModel) {
        let  user = User(context: context)
        user.firstName=registartionUser.firstName
        user.lastName=registartionUser.lastName
        user.email=registartionUser.email
        user.password=registartionUser.password
        appDelegate.saveContext()
    }
    
    func checkValidUserOrNot(email: String,password: String)  -> Result {
        let predicate = NSPredicate(format: "email = %@", email)
        self.fetchRequest.predicate = predicate
        do {
            let result = try context.fetch(self.fetchRequest) as NSArray
            if result.count > 0 {
                let userEntity = result.firstObject as! User
                if(userEntity.email == email && userEntity.password == password) {
                    return Result.SUCCESS
                }
                else {
                    return Result.INVALID_PASSWORD
                }
            }
            else{
                return Result.INVALID_EMAIL
            }
        }
        catch{
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
    }

    func getUser(email: String) throws ->  User {
        var user:User!
        fetchRequest.predicate = NSPredicate(format: "email = %@", email )
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
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
        return user
    }

    
    func deleteUser(email: String) {
        let predicate = NSPredicate(format: "email = %@", email)
        fetchRequest.predicate = predicate
        do{
            let result = try context.fetch(fetchRequest) as NSArray
            let userEntity = result.firstObject as! User
            context.delete(userEntity)
        }
        catch{
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
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
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
    }
    
    func createNote() -> Note {
       return Note(context: context)
    }
    
    func deleteNote(note: Note) {
        do{
        let user = try getUser(email: UserDefaults.standard.string(forKey: Constants.EMAIL_KEY)!)
            user.removeFromNotes(note)
            try context.save()
        }
        catch CoreDataError.UserNotFound {
            fatalError(Constants.USER_NOT_FOUND);
        }
        catch {
            fatalError(Constants.FETCH_ERROR);
        }
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
    
    func getNotesFromDB(fetchLimit:Int, fetchOffSet:Int) -> [Note] {
        var record = [Note]()
        let fetchRequest = NSFetchRequest<Note>(entityName: "Note")
        let predicate = NSPredicate(format: "owner = %@", getCurrentUser())
        fetchRequest.predicate = predicate
        fetchRequest.fetchOffset = fetchOffSet
        fetchRequest.fetchLimit = fetchLimit
        do {
         let fetchedOjects: [Any]? = try self.context.fetch(fetchRequest)
        for i in 0 ..< fetchedOjects!.count {
            let note: Note? = fetchedOjects![i] as? Note
            record.append(note!)
            }
        }
        catch {
            fatalError(Constants.FETCH_ERROR);
        }
        return record
    }
}

