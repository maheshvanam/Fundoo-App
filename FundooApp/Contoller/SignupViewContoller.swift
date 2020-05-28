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
    
    var isExpand = true
    var errorLabels : [UILabel] = []
    var textFields : [UITextField] = []
    
    override func viewDidLoad() {
        initializeArrays()
        for field in textFields {
            field.delegate = self
        }
        
        signUpButton.layer.cornerRadius = 8.0
        signUpButton.isEnabled = false
        
        let viewController = SignInViewController()
        
        logoLabel.attributedText = viewController.getAttributedLogo(logoText: "Fundoo")
        addGuestures()
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
        
        clearErrorLabels()
        clearTextFieldsBackgroundColor()
        
        guard let firstName = firstNameField.text , let lastName = lastNameField.text ,let email = emailField.text ,let password = passwordField.text ,let confirmPassword = confirmField.text else {
            signUpButton.isEnabled = false
            return
        }
        
        let fieldsAreValid = validateFields(firstName: firstName, lastName: lastName, email: email, password: password, confirmPassword: confirmPassword)
        if fieldsAreValid {
            let coreDataService = CoreDataService()
            coreDataService.saveUser(firstName: firstName,lastName: lastName,email: email,password: password)
            showAlert(title: "", message: "Successfully Registered.")
            clearTextFields()
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
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        let textFields = [ firstNameField, lastNameField, emailField, passwordField, confirmField ]

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
    
    func clearTextFields() {
        for textField in textFields {
            textField.text = ""
        }
    }
    
    func clearTextFieldsBackgroundColor(){
        for textField in textFields {
            textField.clearBackgroundColor()
        }
    }
    
    func clearErrorLabels(){
        for label in errorLabels {
            label.text = ""
        }
    }
    
    func initializeArrays(){
        errorLabels = [firstNameErrorLabel, lastNameErrorLabel, emailErrorLabel, passwordErrorLabel, confirmPasswordErrorLabel]
        
        textFields = [ firstNameField, lastNameField, emailField, passwordField, confirmField ]
    }
    
    func addGuestures(){
        NotificationCenter.default.addObserver(self, selector: #selector(keboardAppear), name: UIResponder.keyboardWillShowNotification
            , object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keboardDisappear), name: UIResponder.keyboardWillHideNotification
        , object: nil)
        
        let viewGesture = UITapGestureRecognizer(target: self, action:  #selector (closeKeyboard))
        self.signUpView.addGestureRecognizer(viewGesture)
    }
}
