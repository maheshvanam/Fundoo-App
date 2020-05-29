//
//  CoreDataServiceImpl+CoreDataService.swift
//  FundooApp
//
//  Created by admin on 29/05/20.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation

extension CoreDataServiceImpl : CoreDataService {
    
    func saveUser(firstName: String,lastName: String,email: String,password: String) {
        let  user = User(context: context)
        user.firstName=firstName
        user.lastName=lastName
        user.email=email
        user.password=password
        appDelegate.saveContext()
    }
    
    func checkValidUserOrNot(email: String,password: String) throws -> Result {
        let predicate = NSPredicate(format: "email = %@", email)
        fetchRequest.predicate = predicate
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
}
