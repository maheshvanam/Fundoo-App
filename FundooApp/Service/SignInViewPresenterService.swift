//
//  SignInPresenterService.swift
//  FundooApp
//
//  Created by admin on 29/05/20.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation

protocol SignInViewPresenterService {
    func signInWithEmailAndPassword(email: String,password: String)
    func onCreateAcoountTapped()
}
