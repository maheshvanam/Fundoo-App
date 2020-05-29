//
//  SignupViewController+SignUpViewPresenterDelegate.swift
//  FundooApp
//
//  Created by admin on 29/05/20.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation
import UIKit

extension SignUpViewController: SignUpViewPresenterDelegate {
    
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    func validateFields(firstName: String, lastName: String, email:
        String, password: String, confirmPassword: String)-> Bool {
        
        let fieldValidator = TextFieldValidator()
       
        if !fieldValidator.validateName(name: firstName.trimmingCharacters(in: .whitespaces)) {
            firstNameErrorLabel.text = "*Enter valid first name"
            firstNameField.setBackgroundColour(color: UIColor.red.cgColor)
            showAlert(title: "Error", message: "Enter valid first name")
            return false
        }
        if !fieldValidator.validateName(name: lastName) {
            lastNameErrorLabel.text = "*Enter valid last name"
            lastNameField.setBackgroundColour(color: UIColor.red.cgColor)
            showAlert(title: "Error", message: "Enter valid last name")
            return false
        }
        if !fieldValidator.validateEmailId(emailID: email.trimmingCharacters(in: .whitespaces)) {
            emailErrorLabel.text = "*Enter valid email"
            emailField.setBackgroundColour(color: UIColor.red.cgColor)
            showAlert(title: "Error", message: "Enter valid email")
            return false
        }
        if !fieldValidator.validatePassword(password: password) {
            passwordErrorLabel.text = "*Enter valid password"
            passwordField.setBackgroundColour(color: UIColor.red.cgColor)
            showAlert(title: "Error", message: "Enter valid password")
            return false
        }
        if password != confirmPassword {
            confirmPasswordErrorLabel.text = "*Those passwords didn't match. Try again"
            confirmField.setBackgroundColour(color: UIColor.red.cgColor)
            showAlert(title: "Error", message: "Enter valid confirm password")
            return false
        }
        return true
    }
    
    func checkFieldsAreEmptyOrNot(fields: [UITextField?])-> Bool {
        for field in fields {
            if field?.text!.count == 0 {
                return true
            }
        }
        return false
    }
    
    func clearTextFields() {
        for textField in textFields {
            textField.text = ""
        }
    }
    
    func clearTextFieldsBackgroundColor() {
        for textField in textFields {
            textField.clearBackgroundColor()
        }
    }
}
