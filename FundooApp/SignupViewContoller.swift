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
    
    @IBOutlet weak var confirmField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var lastNameField: UITextField!
    @IBOutlet weak var firstNameField: UITextField!
    @IBOutlet weak var logoLabel: UILabel!
    @IBOutlet weak var signUpButton: UIButton!
    
    override func viewDidLoad() {
        signUpButton.layer.cornerRadius = 8.0
    let viewController = ViewController()
        logoLabel.attributedText = viewController.getAttributedLogo(logoText: "Fundoo")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    @IBAction func onSignUpTapped(_ sender: Any) {
        let validation = Validation()
        guard let firstName = firstNameField.text ,let lastName = lastNameField.text ,let email = emailField.text ,let password = passwordField.text ,let confirmPassword = confirmField.text else {
            print("Empty Fields....")
            return
        }
        
        if !validation.validateName(name: firstName.trimmingCharacters(in: .whitespaces)) {
            print("firstName Error...")
            return
        }
        
        if !validation.validateName(name: lastName) {
            print("lastName Error...")
            return
        }
        
        if !validation.validateEmailId(emailID: email.trimmingCharacters(in: .whitespaces)) {
            print("Email Error...")
            return
        }
        if !validation.validatePassword(password: password) {
            print("password Error...")
            return
        }
        if password != confirmPassword {
            print("confirm Password Error...")
            return
        }
        
        
      }
}
