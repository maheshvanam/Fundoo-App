//
//  ResultData.swift
//  FundooApp
//
//  Created by admin on 08/07/20.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation

struct ResultData:Codable {
    var data:DataResponse?
}

struct DataResponse:Codable {
    var sucess:Bool!
    var message:String!
    var data:[NoteResponse]!
}
