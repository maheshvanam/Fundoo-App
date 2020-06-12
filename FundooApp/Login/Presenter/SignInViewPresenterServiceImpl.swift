//
//  SignInViewPresenterServiceImpl.swift
//  FundooApp
//
//  Created by admin on 29/05/20.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation
import UIKit

class SignInViewPresenterServiceImpl: SignInViewPresenterService {
    
    var signInViewDelegate : PresenterSignInViewDelegate
    init(delegate: PresenterSignInViewDelegate) {
        self.signInViewDelegate = delegate
    }

    
    func signInWithEmailAndPassword(email: String,password: String) {
        
        let coreDataService = DatabaseManager()
        self.signInViewDelegate.clearLabels()
        if email.isEmpty && password.isEmpty {
            self.signInViewDelegate.showAlert(title: "Error", message: "Please fill the all fields")
            return
        }
        let authenticationResult = coreDataService.checkValidUserOrNot(email: email, password: password)
            
        if  authenticationResult == Result.SUCCESS {
            UserDefaults.standard.set(email, forKey:Constants.EMAIL_KEY)
            self.signInViewDelegate.clearFields()
            self.signInViewDelegate.clearLabels()
            self.signInViewDelegate.navigateToUserHomeView()
        }
        else if  authenticationResult == Result.INVALID_EMAIL {
        self.signInViewDelegate.showAlert(title: "Error", message: "Invalid email")
            self.signInViewDelegate.updateEmailLabel()
        }
        else{
            self.signInViewDelegate.showAlert(title: "Error", message: "invalid password")
            self.signInViewDelegate.updatePasswordLabel()
        }
    }
    
    func onCreateAcoountTapped()  {
        self.signInViewDelegate.navigateToSignUpView()
    }

}
