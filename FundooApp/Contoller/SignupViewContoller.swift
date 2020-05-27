//
//  SignupViewContoller.swift
//  FundooApp
//
//  Created by admin on 24/05/20.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation
import UIKit

class SignupViewController: UIViewController {
    
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
    
    var isExpand: Bool = true
    
    override func viewDidLoad() {
        self.scrollView.contentSize = CGSize(width: self.view.frame.width, height: self.scrollView.frame.height)
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
        let textFields = [ firstNameField, lastNameField, emailField, passwordField, confirmField ]
        for field in textFields {
            field?.clearShadowColor()
        }
        
        setLabelColor(color: UIColor.white,firstNameErrorLabel ,lastNameErrorLabel ,emailErrorLabel ,passwordErrorLabel ,confirmPasswordErrorLabel )
        
        let fieldValidator = TextFildsValidator()
        
        guard let firstName = firstNameField.text ,let lastName = lastNameField.text ,let email = emailField.text ,let password = passwordField.text ,let confirmPassword = confirmField.text else {
            return
        }
        
        if !fieldValidator.validateName(name: firstName.trimmingCharacters(in: .whitespaces)) {
            setLabelColor(color: UIColor.red, firstNameErrorLabel)
            firstNameField.setShadowColor(color: UIColor.red.cgColor)
            return
        }
        
        if !fieldValidator.validateName(name: lastName) {
            setLabelColor(color: UIColor.red, lastNameErrorLabel)
            lastNameField.setShadowColor(color: UIColor.red.cgColor)
            return
        }
        
        if !fieldValidator.validateEmailId(emailID: email.trimmingCharacters(in: .whitespaces)) {
            setLabelColor(color: UIColor.red, emailErrorLabel)
            emailField.setShadowColor(color: UIColor.red.cgColor)
            return
        }
        if !fieldValidator.validatePassword(password: password) {
            setLabelColor(color: UIColor.red, passwordErrorLabel)
            passwordField.setShadowColor(color: UIColor.red.cgColor)
            return
        }
        if password != confirmPassword {
            setLabelColor(color: UIColor.red, confirmPasswordErrorLabel)
            confirmField.setShadowColor(color: UIColor.red.cgColor)
            return
        }
        
        let coreDataService = CoreDataService()
        coreDataService.saveUser(firstName: firstName,lastName: lastName,email: email,password: password)
        showAlert()
        
        for field in textFields {
            field?.text=""
        }
    }
    
    func validateTextFields() {
        if firstNameField.text!.count > 0 && lastNameField.text!.count > 0 {
            signUpButton.isEnabled = true
        }
        else {
            signUpButton.isEnabled = false
        }
    }
    
    func setLabelColor(color: UIColor ,_ labels: UILabel...) {
        for label in labels {
            label.textColor = color
        }
    }
    
    func showAlert(){
        let alert = UIAlertController(title: "", message: "Successfully Registered.", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
}

extension UITextField {
    
    func setShadowColor(color: CGColor) {
        self.borderStyle = .roundedRect
        self.layer.shadowColor = color
        self.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 0.0
    }
    
    func clearShadowColor() {
        self.layer.shadowColor = UIColor.clear.cgColor
    }
}
