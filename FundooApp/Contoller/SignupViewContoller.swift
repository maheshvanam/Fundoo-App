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
    @IBOutlet weak var firstNameErrorLabel: UILabel!
    @IBOutlet weak var lastNameErrorLabel: UILabel!
    @IBOutlet weak var emailErrorLabel: UILabel!
    @IBOutlet weak var passwordErrorLabel: UILabel!
    @IBOutlet weak var confirmPasswordErrorLabel: UILabel!
    
    @IBOutlet weak var signUpButton: UIButton!
    
    var isExpand = true
    var errorLabels : [UILabel] = []
    var textFields : [UITextField] = []
    var signUpViewPresenter: SignUpViewPresenterService?
    
    
    override func viewDidLoad() {
        signUpViewPresenter = SignUpViewPresenter(delegate: self)
        initializeArrays()
        signUpButton.layer.cornerRadius = 8.0
        signUpButton.isEnabled = false
        addGuestures()
        logoLabel.attributedText = Helper.getAttributedLogo()
        for field in textFields {
            field.delegate = self
        }
    }
    
    @IBAction func onSiginInInsteadTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: false)
    }
    
    @IBAction func onSignUpTapped(_ sender: Any) {
        
        
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
}
