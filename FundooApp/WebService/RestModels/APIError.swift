//
//  APIError.swift
//  FundooApp
//
//  Created by admin on 05/07/20.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation

enum APIError: String,Error {
    case responseError
    case decodingError
    case encodingError
}
struct APIErrorMessage {
    static let responseError = "response Error.."
    static let decodingError = "error occured while decoding.."
    static let encodingError = "error occured while encoding.."
}
