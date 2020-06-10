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
        fetchRequest.predicate = predicate
        do {
            let result = try context.fetch(fetchRequest) as NSArray
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
        fetchRequest.predicate = NSPredicate(format: "email = %@", email)
        do{
            let result = try context.fetch(fetchRequest) as NSArray
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
    
    func insertNote(title: String ,note: String) {
        let email = UserDefaults.standard.string(forKey: Constants.EMAIL_KEY)
        let predicate = NSPredicate(format: "email = %@", email!)
              fetchRequest.predicate = predicate
              do{
                  let result = try context.fetch(fetchRequest) as NSArray
                  let userEntity = result.firstObject as! User
                let noteModel = Note(context: context)
                noteModel.note = note
                noteModel.title = title
                noteModel.creationTime = Date()
                userEntity.addToNotes(noteModel)
                 try context.save()
                
              }
              catch{
                  let nserror = error as NSError
                  fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
    }
    
    func getAllNotes() -> NSArray? {
        let fetchRequest = NSFetchRequest<Note>(entityName: "Note")
        let email = UserDefaults.standard.string(forKey: Constants.EMAIL_KEY)
        var result: NSArray?
        do{
            let user = try getUser(email: email!)
            fetchRequest.predicate = NSPredicate(format: "owner = %@", user)
            result = try context.fetch(fetchRequest) as NSArray
        }
        catch{
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
        return result
    }
    
    func deleteNote(title: String) {
        let email = UserDefaults.standard.string(forKey: Constants.EMAIL_KEY)
        do{
            let user = try getUser(email: email!)
           let notes = user.notes
            for note in notes! {
                if (note as! Note).title == title {
                    user.removeFromNotes(note as! Note)
                    try context.save()
                    break
                }
            }
        }
        catch{
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
    }
    
    func UpdateNote(note: Note) {
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
    
}
