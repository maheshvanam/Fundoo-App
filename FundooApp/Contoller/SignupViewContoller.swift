//
//  SignupViewContoller.swift
//  FundooApp
//
//  Created by admin on 24/05/20.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation
import UIKit

class SignupViewController: UIViewController, UITextFieldDelegate{
    
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
        
        signUpButton.layer.cornerRadius = 8.0
        
        let viewController = LoginViewController()
        
        logoLabel.attributedText = viewController.getAttributedLogo(logoText: "Fundoo")
        
        NotificationCenter.default.addObserver(self, selector: #selector(keboardAppear), name: UIResponder.keyboardWillShowNotification
            , object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keboardDisappear), name: UIResponder.keyboardWillHideNotification
        , object: nil)
        
        let viewGesture = UITapGestureRecognizer(target: self, action:  #selector (closeKeyboard))
        self.signUpView.addGestureRecognizer(viewGesture)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        let textFields = [ firstNameField, lastNameField, emailField, passwordField, confirmField ]

        for field in textFields {
            field?.clearBackgroundColor()
        }
        
        setLabelColor(color: UIColor.white,firstNameErrorLabel ,lastNameErrorLabel ,emailErrorLabel ,passwordErrorLabel ,confirmPasswordErrorLabel )
        
        guard let firstName = firstNameField.text , let lastName = lastNameField.text ,let email = emailField.text ,let password = passwordField.text ,let confirmPassword = confirmField.text else {
            signUpButton.isEnabled = false
            return
        }
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.password = password
        self.confirmPassword = confirmPassword
        
        fieldsAreValid = validateFields(firstName: firstName, lastName: lastName, email: email, password: password, confirmPassword: confirmPassword)
        
        if fieldsAreValid {
            signUpButton.isEnabled = true
        }
        else
        {
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
    
    @IBAction func onSiginInInsteadTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: false)
    }
    
    @IBAction func onSignUpTapped(_ sender: Any) {
        
        showAlert(title: "tapped", message: "")
        
        if fieldsAreValid {
            let coreDataService = CoreDataService()
            coreDataService.saveUser(firstName: firstName,lastName: lastName,email: email,password: password)
            showAlert(title: "", message: "Successfully Registered.")
        }
    }
    
    func setLabelColor(color: UIColor ,_ labels: UILabel...) {
        for label in labels {
            label.textColor = color
        }
    }
    
    func showAlert(title: String, message: String) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func validateFields(firstName: String, lastName: String, email:
        String, password: String, confirmPassword: String)-> Bool {
        
        let fieldValidator = TextFildsValidator()
       
        if !fieldValidator.validateName(name: firstName.trimmingCharacters(in: .whitespaces)) && firstName.count != 0 {
            setLabelColor(color: UIColor.red, firstNameErrorLabel)
            firstNameField.setBackgroundColour(color: UIColor.red.cgColor)
            showAlert(title: "Error", message: "Enter valid first name")
            return false
        }
    
        if !fieldValidator.validateName(name: lastName) && lastName.count != 0 {
            setLabelColor(color: UIColor.red, lastNameErrorLabel)
            lastNameField.setBackgroundColour(color: UIColor.red.cgColor)
            showAlert(title: "Error", message: "Enter valid last name")
            return false
        }
    
        if !fieldValidator.validateEmailId(emailID: email.trimmingCharacters(in: .whitespaces)) && email.count != 0 {
            setLabelColor(color: UIColor.red, emailErrorLabel)
            emailField.setBackgroundColour(color: UIColor.red.cgColor)
            showAlert(title: "Error", message: "Enter valid email")
            return false
        }
        
        if !fieldValidator.validatePassword(password: password) && password.count != 0 {
            setLabelColor(color: UIColor.red, passwordErrorLabel)
            passwordField.setBackgroundColour(color: UIColor.red.cgColor)
            showAlert(title: "Error", message: "Enter valid password")
            return false
        }
        
        if password != confirmPassword && confirmPassword.count != 0 {
            setLabelColor(color: UIColor.red, confirmPasswordErrorLabel)
            confirmField.setBackgroundColour(color: UIColor.red.cgColor)
            showAlert(title: "Error", message: "Enter valid confirm password")
            return false
        }
        return true
    }
    
}
