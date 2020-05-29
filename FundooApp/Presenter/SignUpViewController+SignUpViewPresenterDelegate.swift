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
    
    func clearErrorLabels() {
        for label in errorLabels {
            label.text = ""
        }
    }
    
    func initializeArrays() {
        errorLabels = [firstNameErrorLabel, lastNameErrorLabel, emailErrorLabel, passwordErrorLabel, confirmPasswordErrorLabel]
        
        textFields = [ firstNameField, lastNameField, emailField, passwordField, confirmField ]
    }
    
    func addGuestures() {
        NotificationCenter.default.addObserver(self, selector: #selector(keboardAppear), name: UIResponder.keyboardWillShowNotification
            , object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keboardDisappear), name: UIResponder.keyboardWillHideNotification
        , object: nil)
        
        let viewGesture = UITapGestureRecognizer(target: self, action:  #selector (closeKeyboard))
        self.signUpView.addGestureRecognizer(viewGesture)
    }
    
    @objc func closeKeyboard() {
        self.signUpView.endEditing(true)
    }
    
    @objc func keboardAppear() {
        if isExpand {
            self.scrollView.contentSize = CGSize(width: self.view.frame.width, height: self.scrollView.frame.height + 150)
            isExpand = false
        }
    }
    
    @objc func keboardDisappear() {
       self.scrollView.contentSize = CGSize(width: self.view.frame.width, height: self.scrollView.frame.height - 150)
        isExpand=true
    }
    
    func getUser ()->User {
        guard let firstName = firstNameField.text , let lastName = lastNameField.text ,let email = emailField.text ,let password = passwordField.text ,let confirmPassword = confirmField.text else {
            signUpButton.isEnabled = false
            return
        }
        var user = User()
    }
}
