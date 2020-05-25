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

class CoreDataService {
    
    private let appDelegate = UIApplication.shared.delegate as! AppDelegate
    private let context = ( UIApplication.shared.delegate as! AppDelegate ).persistentContainer.viewContext
    private let fetchRequest = NSFetchRequest<User>(entityName: "User")
    
    func saveUser(firstName: String,lastName: String,email: String,password: String) {
        let  user = User(context: context)
        user.firstName=firstName
        user.lastName=lastName
        user.email=email
        user.password=password
        appDelegate.saveContext()
    }
    
    func checkValidUserOrNot(email: String,password: String)-> (String, Bool) {
        let predicate = NSPredicate(format: "email = %@", email)
        fetchRequest.predicate = predicate
        do{
            let result = try context.fetch(fetchRequest) as NSArray
            if result.count > 0 {
                let userEntity = result.firstObject as! User
                if(userEntity.email == email && userEntity.password == password) {
                    return ("Success",true)
                }
                else {
                    return ("Unsuccess",false)
                }
            }
            else{
                return("invalidEmail",false)
            }
        }
        catch{
            let fetchError =  error as NSError
            print("error", fetchError.localizedDescription)
        }
        return ("Unsucess",false)
    }
    
}
