//
//  SignupViewContoller.swift
//  FundooApp
//
//  Created by admin on 24/05/20.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation
import UIKit

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var signUpView: UIView!
    @IBOutlet weak var confirmField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var lastNameField: UITextField!
    @IBOutlet weak var firstNameField: UITextField!
    @IBOutlet weak var logoLabel: UILabel!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var firstNameErrorLabel: UILabel!
    @IBOutlet weak var lastNameErrorLabel: UILabel!
    @IBOutlet weak var emailErrorLabel: UILabel!
    @IBOutlet weak var passwordErrorLabel: UILabel!
    @IBOutlet weak var confirmPasswordErrorLabel: UILabel!
    
    var isExpand = true, fieldsAreValid = false
    var firstName = "", lastName = "",email = "", password = "", confirmPassword = ""
    
    override func viewDidLoad() {
        
        let textFields = [ firstNameField, lastNameField, emailField, passwordField, confirmField ]
        
        for field in textFields {
            field?.delegate = self
        }
        signUpButton.layer.backgroundColor = UIColor.gray.cgColor
        signUpButton.layer.cornerRadius = 8.0
        
        let viewController = SignInViewController()
        
        logoLabel.attributedText = viewController.getAttributedLogo(logoText: "Fundoo")
        
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
    
    @IBAction func onSiginInInsteadTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: false)
    }
    
    @IBAction func onSignUpTapped(_ sender: Any) {
        
        if fieldsAreValid {
            let coreDataService = CoreDataService()
            coreDataService.saveUser(firstName: firstName,lastName: lastName,email: email,password: password)
            showAlert(title: "", message: "Successfully Registered.")
            clearAllFields()
        }
    }
    
    
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func validateFields(firstName: String, lastName: String, email:
        String, password: String, confirmPassword: String)-> Bool {
        
        let fieldValidator = TextFieldValidator()
       
        if !fieldValidator.validateName(name: firstName.trimmingCharacters(in: .whitespaces)) && !firstName.isEmpty {
            firstNameErrorLabel.text = "*Enter valid first name"
            firstNameField.setBackgroundColour(color: UIColor.red.cgColor)
            showAlert(title: "Error", message: "Enter valid first name")
            return false
        }
        if !fieldValidator.validateName(name: lastName) && lastName.count != 0 {
            lastNameErrorLabel.text = "*Enter valid last name"
            lastNameField.setBackgroundColour(color: UIColor.red.cgColor)
            showAlert(title: "Error", message: "Enter valid last name")
            return false
        }
        if !fieldValidator.validateEmailId(emailID: email.trimmingCharacters(in: .whitespaces)) && email.count != 0 {
            emailErrorLabel.text = "*Enter valid email"
            emailField.setBackgroundColour(color: UIColor.red.cgColor)
            showAlert(title: "Error", message: "Enter valid email")
            return false
        }
        if !fieldValidator.validatePassword(password: password) && password.count != 0 {
            passwordErrorLabel.text = "*Enter valid password"
            passwordField.setBackgroundColour(color: UIColor.red.cgColor)
            showAlert(title: "Error", message: "Enter valid password")
            return false
        }
        if password != confirmPassword && confirmPassword.count != 0 {
            confirmPasswordErrorLabel.text = "*Those passwords didn't match. Try again"
            confirmField.setBackgroundColour(color: UIColor.red.cgColor)
            showAlert(title: "Error", message: "Enter valid confirm password")
            return false
        }
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        let textFields = [ firstNameField, lastNameField, emailField, passwordField, confirmField ]
/*
        for field in textFields {
            field?.clearBackgroundColor()
        }
        
        setLabelColor(color: UIColor.white,firstNameErrorLabel ,lastNameErrorLabel ,emailErrorLabel ,passwordErrorLabel ,confirmPasswordErrorLabel )*/
        
        /*guard let firstName = firstNameField.text , let lastName = lastNameField.text ,let email = emailField.text ,let password = passwordField.text ,let confirmPassword = confirmField.text else {
            signUpButton.isEnabled = false
            return
        }
        
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.password = password
        self.confirmPassword = confirmPassword
        
        fieldsAreValid = validateFields(firstName: firstName, lastName: lastName, email: email, password: password, confirmPassword: confirmPassword)*/
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
    
    func checkFieldsAreEmptyOrNot(fields: [UITextField?])-> Bool {
        for field in fields {
            if field?.text!.count == 0 {
                return true
            }
        }
        return false
    }
    
    func clearAllFields() {
        firstNameField.text = ""
        lastNameField.text = ""
        emailField.text = ""
        passwordField.text = ""
        confirmField.text = ""
    }
}
