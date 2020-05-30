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
    
    func validateFields(user: SignUpUser)-> Bool {
        
        let fieldValidator = TextFieldValidator()
       
        if !fieldValidator.validateName(name: user.firstName!.trimmingCharacters(in: .whitespaces)) {
            firstNameErrorLabel.text = "*Enter valid first name"
            firstNameField.setBackgroundColour()
            showAlert(title: "Error", message: "Enter valid first name")
            return false
        }
        if !fieldValidator.validateName(name: user.lastName!) {
            lastNameErrorLabel.text = "*Enter valid last name"
            lastNameField.setBackgroundColour()
            showAlert(title: "Error", message: "Enter valid last name")
            return false
        }
        if !fieldValidator.validateEmailId(emailID: user.email!.trimmingCharacters(in: .whitespaces)) {
            emailErrorLabel.text = "*Enter valid email"
            emailField.setBackgroundColour()
            showAlert(title: "Error", message: "Enter valid email")
            return false
        }
        if !fieldValidator.validatePassword(password: user.password!) {
            passwordErrorLabel.text = "*Enter valid password"
            passwordField.setBackgroundColour()
            showAlert(title: "Error", message: "Enter valid password")
            return false
        }
        if user.password! != user.confirmPassword! {
            confirmPasswordErrorLabel.text = "*Those passwords didn't match. Try again"
            confirmField.setBackgroundColour()
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
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        let fieldsAreEmpty = checkFieldsAreEmptyOrNot(fields: textFields)
        if !fieldsAreEmpty{
            signUpButton.isEnabled = true
            signUpButton.layer.backgroundColor = UIColor.blue.cgColor
        }
        else
        {
            signUpButton.layer.backgroundColor = UIColor.gray.cgColor
            signUpButton.isEnabled = false
        }
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
    
    func getUser ()->SignUpUser {
        var user: SignUpUser?
        guard let firstName = firstNameField.text , let lastName = lastNameField.text ,let email = emailField.text ,let password = passwordField.text ,let confirmPassword = confirmField.text else {
            signUpButton.isEnabled = false
            return user!
        }
        user = SignUpUser(firstName: firstName, lastName: lastName, email: email, password: password, confirmPassword: confirmPassword)
        return user!
    }
    
    func navigateToLoginView(){
        self.navigationController?.popViewController(animated: false)
    }
}
