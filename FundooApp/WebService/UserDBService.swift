//
//  UserDBService.swift
//  FundooApp
//
//  Created by admin on 04/07/20.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation

protocol UserDBService {
    func signInUser(user:FundooUser, completion: @escaping (Result<FundooUser,APIError>)->Void )
    func saveUser(user:FundooUser, completion: @escaping (Result<Int,APIError>)->Void )
}
