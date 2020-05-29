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
        
        
        
        let fieldsAreValid = validateFields(firstName: firstName, lastName: lastName, email: email, password: password, confirmPassword: confirmPassword)
        if fieldsAreValid {
            let coreDataService = CoreDataServiceImpl()
            coreDataService.insertUser(firstName: firstName,lastName: lastName,email: email,password: password)
            showAlert(title: "", message: "Successfully Registered.")
            clearTextFields()
        }
    }
}
