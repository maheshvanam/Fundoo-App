//
//  SignInViewController+PresenterSignInView.swift
//  FundooApp
//
//  Created by admin on 29/05/20.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation
import UIKit
extension SignInViewController: PresenterSignInViewDelegate {
    
    func clearLabels() {
        self.emailField.text=""
        self.passwordField.text=""
    }
    
    func updatePasswordLabel() {
          self.emailErrorLabel.text = "*Enter valid password."
    }
    
    func updateEmailLabel() {
        self.emailErrorLabel.text = "*Couldn't find your Fundoo Account."
    }
    
    func navigateToUserHomeView() {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        guard let destinationViewController = mainStoryboard.instantiateViewController(identifier: "UserHomeController") as? UserHomeController else {
                return
            }
        self.dismiss(animated: false, completion: nil)
            navigationController?.pushViewController(destinationViewController, animated:false)
    }
    
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    
}
