//
//  SignInViewController+PresenterSignInView.swift
//  FundooApp
//
//  Created by admin on 29/05/20.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation
import UIKit

extension SignInViewController: PresenterSignInViewDelegate {
    
    func clearLabels() {
        self.emailErrorLabel.text = ""
        self.passwordErrorLabel.text = ""
        self.emailField.clearBackgroundColor()
        self.passwordField.clearBackgroundColor()
    }
    
    func clearFields(){
        self.emailField.text = ""
        self.passwordField.text = ""
        self.emailField.clearBackgroundColor()
        self.passwordField.clearBackgroundColor()
        
    }
    
    func updatePasswordLabel() {
        self.passwordField.setBackgroundColour()
        self.passwordErrorLabel.text = "*Enter valid password."
    }
    
    func updateEmailLabel() {
        self.emailField.setBackgroundColour()
        self.emailErrorLabel.text = "*Couldn't find your Fundoo Account."
    }
    
    func navigateToUserHomeView() {
        UserDefaults.standard.set(true, forKey: "IS_LOGGED_IN")
        show(ContainerController(), sender: self)
    }
    
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func navigateToSignUpView() {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        guard let destinationViewController = mainStoryboard.instantiateViewController(identifier: "SignupViewController") as? SignUpViewController else {
                 return
            }
        navigationController?.pushViewController(destinationViewController, animated: false)
        }
    
}
