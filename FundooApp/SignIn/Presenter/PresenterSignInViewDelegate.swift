//
//  PresenterSignInViewDelegate.swift
//  FundooApp
//
//  Created by admin on 29/05/20.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation

protocol PresenterSignInViewDelegate {
    
    func clearLabels()
    func clearFields()
    func updatePasswordLabel()
    func updateEmailLabel()
    func navigateToUserHomeView()
    func showAlert(title: String, message: String)
    func navigateToSignUpView()
}
