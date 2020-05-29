//
//  SignUpViewPresenterServiceImpl.swift
//  FundooApp
//
//  Created by admin on 29/05/20.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation
class SignUpViewPresenterServiceImpl: SignUpViewPresenterService {
    var signUpViewDelegate : SignupViewPresenterDelegate
    init(delegate: SignupViewPresenterDelegate) {
        self.signUpViewDelegate = delegate
    }
}
