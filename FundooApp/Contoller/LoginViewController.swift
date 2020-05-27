//
//  ViewController.swift
//  FundooApp
//
//  Created by admin on 24/05/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailErrorLabel: UILabel!
    @IBOutlet weak var passwordErrorLabel: UILabel!
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var logoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        signInButton.layer.cornerRadius = 8.0
        let text = "Fundoo"
        logoLabel.attributedText = self.getAttributedLogo(logoText : text)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func onSignInTapped(_ sender: Any) {
        let coreDataService = CoreDataService()
        
        emailErrorLabel.textColor = UIColor.white
        passwordErrorLabel.textColor = UIColor.white
        
        guard let email = emailField.text ,let password = passwordField.text else {
            return
        }
        
        let authenticationResult = coreDataService.checkValidUserOrNot(email: email, password: password)
        
        if  authenticationResult.1 {
            emailField.text=""
            passwordField.text=""
            openUserHome()
        }
        else if  authenticationResult.0 == "invalidEmail"{
            showAlert(title: "Error", message: "Invalid email")
            emailErrorLabel.textColor = UIColor.red
        }
        else{
            showAlert(title: "Error", message: "invalid password")
            passwordErrorLabel.textColor = UIColor.red
        }
    }
    
    @IBAction func onCreateAcoountTapped(_ sender: Any) {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        guard let destinationViewController = mainStoryboard.instantiateViewController(identifier: "SignupViewController") as? SignupViewController else {
                 return
            }
        navigationController?.pushViewController(destinationViewController, animated: false)
    }
    
    func getAttributedLogo(logoText : String ) -> NSAttributedString {
        var colorsArray : [UIColor] = [ UIColor.blue , UIColor.red , UIColor.yellow ,
                                        UIColor.blue , UIColor.green , UIColor.red ]
        colorsArray.append(UIColor.blue)
        let attributedLogo = NSMutableAttributedString(string: logoText)
        for i in 0...5 {
            attributedLogo.addAttribute(.foregroundColor,
                                        value: colorsArray[i], range: NSRange(location: i,length: 1))
        }
        return attributedLogo
    }
    
    func openUserHome() {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        guard let destinationViewController = mainStoryboard.instantiateViewController(identifier: "UserHomeController") as? UserHomeController else {
                 return
             }
        self.dismiss(animated: false, completion: nil)
             navigationController?.pushViewController(destinationViewController, animated: false)
    }
    
    func showAlert(title: String, message: String) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

