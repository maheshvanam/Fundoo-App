//
//  FundooUser.swift
//  FundooApp
//
//  Created by admin on 05/07/20.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation

class UserResponse: Codable {
    
    var firstName   :   String?
    var lastName    :   String?
    var email       :   String?
    var password    :   String?
    var service     :   String?
    var id          :   String?
    var ttl         :   Int?
    var created     :   String?
    var userId      :   String?
    var role        :   String?
    var imageUrl    :   String?
    
    init( email: String ,password: String) {
        self.email       = email
        self.password    = password
    }
    
    init(firstName: String, lastName: String, email: String ,password: String) {
        self.firstName   = firstName
        self.lastName    = lastName
        self.email       = email
        self.password    = password
        self.service     = "basic"
    }
}
