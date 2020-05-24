//
//  Validation.swift
//  FundooApp
//
//  Created by admin on 25/05/20.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation
class Validation {
    
    public func validateName(name: String) ->Bool {
        let nameRegix = "^\\w{3,12}"
        let validateName = NSPredicate(format: "SELF MATCHES%@",nameRegix)
        return validateName.evaluate(with: name)
    }
    
    public func validateEmailId(emailID: String) -> Bool {
         let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
         let validateEmail = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
         return validateEmail.evaluate(with: emailID)
    }
    
    public func validatePassword(password: String) -> Bool {
       let passRegEx = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{8,}$"
       let validatePassord = NSPredicate(format:"SELF MATCHES %@", passRegEx)
       return validatePassord.evaluate(with: password)
    }
    
}
