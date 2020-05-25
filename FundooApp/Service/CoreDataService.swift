//
//  PersistenceService.swift
//  FundooApp
//
//  Created by admin on 25/05/20.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation
import UIKit

class CoreDataService {
    
    private let appDelegate = UIApplication.shared.delegate as! AppDelegate
    private let context = ( UIApplication.shared.delegate as! AppDelegate ).persistentContainer.viewContext
    
    func saveUser(firstName: String,lastName: String,email: String,password: String) {
        let  user = User(context: context)
        user.firstName=firstName
        user.lastName=lastName
        user.email=email
        user.password=password
        appDelegate.saveContext()
    }
}
