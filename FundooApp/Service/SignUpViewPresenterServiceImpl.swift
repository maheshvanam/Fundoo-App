//
//  SignUpViewPresenterServiceImpl.swift
//  FundooApp
//
//  Created by admin on 29/05/20.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation
class SignUpViewPresenterServiceImpl: SignUpViewPresenterService {
    var signUpViewDelegate : SignUpViewPresenterDelegate
    init(delegate: SignUpViewPresenterDelegate) {
        self.signUpViewDelegate = delegate
    }
}