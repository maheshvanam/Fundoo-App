//
//  SignInPresenterServiceImpl.swift
//  FundooApp
//
//  Created by admin on 29/05/20.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation
import UIKit

class SignInViewPresenterServiceImpl: SignInViewPresenterService {
    
    var signDelegate : SignInDelegate
       init(delegate: SignInDelegate) {
           self.signDelegate = delegate
       }
    
    func signInWithEmailAndPassword(email: String,password: String) {
        
        let coreDataService = CoreDataService()
        self.signDelegate.emailErrorLabel.text = ""
        self.signDelegate.passwordErrorLabel.text = ""

        if email.isEmpty && password.isEmpty {
            self.signDelegate.showAlert(title: "Error", message: "Please fill the all fields")
            return
        }
        do{
            let authenticationResult = try coreDataService.checkValidUserOrNot(email: email, password: password)
            
            if  authenticationResult == Result.SUCCESS {
                self.signDelegate.emailField.text=""
                self.signDelegate.passwordField.text=""
                self.signDelegate.openUserHome()
            }
            else if  authenticationResult == Result.INVALID_EMAIL {
                self.signDelegate.showAlert(title: "Error", message: "Invalid email")
                self.signDelegate.emailErrorLabel.text = "*Couldn't find your Fundoo Account."
            }
            else{
                self.signDelegate.showAlert(title: "Error", message: "invalid password")
                self.signDelegate.passwordErrorLabel.text = "*Wrong password. Try again or click Forgot password to reset it."
            }
        }
        catch{
            self.signDelegate.showAlert(title: "Fetch Error", message: "Fetching data is failed...")
        }
    }

}
