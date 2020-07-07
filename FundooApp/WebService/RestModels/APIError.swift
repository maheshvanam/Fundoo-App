//
//  APIError.swift
//  FundooApp
//
//  Created by admin on 05/07/20.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation

enum APIError: Error {
    case responseError
    case decodingError
    case encodingError
}
