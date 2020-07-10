//
//  LabelResponse.swift
//  FundooApp
//
//  Created by admin on 10/07/20.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation

class LabelResponse:Codable {
    var label:String = ""
    var isDeleted:Bool = false
    var userId:String = ""
    
    init(label:String,isDeleted:Bool,userId:String) {
        self.label = label
        self.isDeleted = isDeleted
        self.userId = userId
    }
    
    func toDictionary()-> [String:Any] {
        return ["label": self.label, "isDeleted": self.isDeleted, "userId": self.userId]
    }
}
