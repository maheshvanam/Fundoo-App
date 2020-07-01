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
    func isLoggedIn()-> Bool
    func signOutUser()
    func signInwithEmailAndPassword(email: String,password: String)
}
