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
        
        let dbManager = DatabaseManager()
        self.signInViewDelegate.clearLabels()
        if email.isEmpty && password.isEmpty {
            self.signInViewDelegate.showAlert(title: "Error", message: "Please fill the all fields")
            return
        }
        dbManager.signInwithEmailAndPassword(email: email, password: password)
        let authenticationResult = dbManager.isLoggedIn()
        
            
        if  authenticationResult == true {
            UserDefaults.standard.set(email, forKey:Constants.EMAIL_KEY)
            self.signInViewDelegate.clearFields()
            self.signInViewDelegate.clearLabels()
            self.signInViewDelegate.navigateToUserHomeView()
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
