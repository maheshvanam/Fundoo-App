//
//  SignInDelegate.swift
//  FundooApp
//
//  Created by admin on 28/05/20.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation
import UIKit

protocol SignInDelegate {
    
    var emailField: UITextField! { get set }
    var passwordField: UITextField! { get set }
    var emailErrorLabel: UILabel! { get set }
    var passwordErrorLabel: UILabel! { get set }
    
    func openUserHome()
    func showAlert(title: String, message: String)
    
}
