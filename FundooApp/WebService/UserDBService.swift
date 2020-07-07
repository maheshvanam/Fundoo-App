//
//  UserDBService.swift
//  FundooApp
//
//  Created by admin on 04/07/20.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation

protocol UserDBService {
    func signInUser(user:UserResponse, completion: @escaping (Result<UserResponse,APIError>)->Void )
    func saveUser(user:UserResponse, completion: @escaping (Result<Int,APIError>)->Void )
}
