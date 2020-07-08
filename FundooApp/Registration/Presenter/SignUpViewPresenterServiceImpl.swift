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
            let newUser = UserResponse(firstName: user.firstName!, lastName: user.lastName!, email: user.email!, password: user.password!)
            let dbManager = RemoteUserManager(endpoint: "user/userSignup")
            dbManager.saveUser(user: newUser) { (result) in
                switch result {
                case .success( _ ) :
                    self.signUpViewDelegate.showAlert(title: "Success", message: "Successfully Registered.")
                    self.signUpViewDelegate.clearTextFields()
                case .failure( _ ):
                    self.signUpViewDelegate.showAlert(title: "Error", message: "signUp failed...")
                }
            }
        }
    }
    func onSiginInInsteadTapped() {
        self.signUpViewDelegate.navigateToLoginView()
    }
}
