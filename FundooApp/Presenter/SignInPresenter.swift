//
//  SignInPresenter.swift
//  FundooApp
//
//  Created by admin on 28/05/20.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation
import UIKit
class SignInPresenter {
    
    var signDelegate : SignInDelegate
    init(delegate: SignInDelegate) {
        self.signDelegate = delegate
    }
    
    func signInWithEmailAndPassword(email: String,password: String) {
        let coreDataService = CoreDataService()
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
                self.signDelegate.emailErrorLabel.textColor = UIColor.red
            }
            else{
                self.signDelegate.showAlert(title: "Error", message: "invalid password")
                self.signDelegate.passwordErrorLabel.textColor = UIColor.red
            }
        }
        catch{
            self.signDelegate.showAlert(title: "Fetch Error", message: "Fetching data is failed...")
        }
    }
}

protocol SignInDelegate {
    var emailField: UITextField! { get set }
    var passwordField: UITextField! { get set }
    var emailErrorLabel: UILabel! { get set }
    var passwordErrorLabel: UILabel! { get set }
    
    func openUserHome()
    func showAlert(title: String, message: String)
}
