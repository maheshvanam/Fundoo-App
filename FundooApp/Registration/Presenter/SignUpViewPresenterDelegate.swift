//
//  SignupViewPresenterDelegate.swift
//  FundooApp
//
//  Created by admin on 29/05/20.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation
import UIKit

protocol SignUpViewPresenterDelegate {
    func showAlert(title: String, message: String)
    func validateFields(user: SignUpUser)-> Bool
    func checkFieldsAreEmptyOrNot(fields: [UITextField?])-> Bool
    func clearTextFields()
    func clearTextFieldsBackgroundColor()
    func clearErrorLabels()
    func getUser ()->SignUpUser
    func navigateToLoginView()
}
