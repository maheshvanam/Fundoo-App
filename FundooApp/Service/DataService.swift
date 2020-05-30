//
//  CoreDataService.swift
//  FundooApp
//
//  Created by admin on 29/05/20.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation
protocol DataService {
    
    func insertUser(registartionUser: SignUpUser)
    func checkValidUserOrNot(email: String,password: String) throws -> Result
    func deleteUser(email: String)
}
