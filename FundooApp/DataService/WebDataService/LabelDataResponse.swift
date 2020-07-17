//
//  LabelDataResponse.swift
//  FundooApp
//
//  Created by admin on 10/07/20.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation

struct LabelDataResponse:Codable {
    var data:LabelData?
}
struct LabelData:Codable {
    var success = true
    var message = ""
    var details:[LabelResponse] = []
}
