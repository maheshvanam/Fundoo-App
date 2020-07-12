//
//  RegistrationUser.swift
//  FundooApp
//
//  Created by admin on 29/05/20.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation

class UserModel {
    
    var firstName: String?
    var lastName: String?
    var email: String?
    var password: String?
    var confirmPassword: String?
    
    init(firstName: String, lastName: String, email: String ,password: String , confirmPassword: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.password = password
        self.confirmPassword = confirmPassword
    }
    
    init(userModel: User) {
        self.firstName = userModel.firstName
        self.lastName = userModel.lastName
        self.email = userModel.email
        self.password = userModel.password
    }
}
