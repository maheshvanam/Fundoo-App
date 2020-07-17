//
//  APIError.swift
//  FundooApp
//
//  Created by admin on 05/07/20.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation

enum APIError: String,Error {
    static let responseErrorMessage = "response Error.."
    static let decodingErrorMessage = "error occured while decoding.."
    static let encodingErrorMessage = "error occured while encoding.."
    case responseError
    case decodingError
    case encodingError
}
