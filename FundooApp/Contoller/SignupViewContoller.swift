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
    
    @IBOutlet weak var firstNameErrorLabel: UILabel!
    @IBOutlet weak var lastNameErrorLabel: UILabel!
    @IBOutlet weak var emailErrorLabel: UILabel!
    @IBOutlet weak var passwordErrorLabel: UILabel!
    @IBOutlet weak var confirmPasswordErrorLabel: UILabel!
    
    override func viewDidLoad() {
        signUpButton.layer.cornerRadius = 8.0
    let viewController = ViewController()
        logoLabel.attributedText = viewController.getAttributedLogo(logoText: "Fundoo")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func onSiginInInsteadTapped(_ sender: Any) {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        guard let destinationViewController = mainStoryboard.instantiateViewController(identifier: "ViewController") as? ViewController else {
            return
        }
        navigationController?.pushViewController(destinationViewController, animated: false)
    }
    
    @IBAction func onSignUpTapped(_ sender: Any) {
        
        firstNameField.clearShadowColor()
        lastNameField.clearShadowColor()
        emailField.clearShadowColor()
        passwordField.clearShadowColor()
        confirmField.clearShadowColor()
        
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
        firstNameField.text=""
        lastNameField.text=""
        emailField.text=""
        passwordField.text=""
    }
    
    func setLabelColor(color: UIColor ,_ labels: UILabel...) {
        for label in labels {
            label.textColor = color
        }
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
