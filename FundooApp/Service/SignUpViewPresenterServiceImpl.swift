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
    
    func onSignUpTapped() {
        self.signUpViewDelegate.clearErrorLabels()
        self.signUpViewDelegate.clearTextFieldsBackgroundColor()
        let user = self.signUpViewDelegate.getUser()
        let fieldsAreValid = self.signUpViewDelegate.validateFields(user:user)
        if fieldsAreValid {
            let coreDataService = CoreDataServiceImpl()
            coreDataService.insertUser(registartionUser: user)
            self.signUpViewDelegate.showAlert(title: "", message: "Successfully Registered.")
            self.signUpViewDelegate.clearTextFields()
        }
    }
    func onSiginInInsteadTapped() {
        self.signUpViewDelegate.navigateToLoginView()
    }
}
