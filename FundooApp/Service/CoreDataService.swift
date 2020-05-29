//
//  CoreDataService.swift
//  FundooApp
//
//  Created by admin on 29/05/20.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation
protocol CoreDataService {
    
    func insertUser(firstName: String,lastName: String,email: String,password: String)
    
    func checkValidUserOrNot(email: String,password: String) throws -> Result
}
