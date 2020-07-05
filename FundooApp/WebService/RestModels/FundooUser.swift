//
//  FundooUser.swift
//  FundooApp
//
//  Created by admin on 05/07/20.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation

class FundooUser: Codable {
    
    var firstName   :  String?
    var lastName    :  String?
    var email       :  String?
    var password    :  String?
    var service     : String?
    
    init(firstName: String, lastName: String, email: String ,password: String) {
        self.firstName   = firstName
        self.lastName    = lastName
        self.email       = email
        self.password    = password
        self.service     = "basic"
    }
}
