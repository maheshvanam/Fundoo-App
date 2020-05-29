//
//  ViewController.swift
//  FundooApp
//
//  Created by admin on 24/05/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {
    
    var signInViewPresenter: SignInViewPresenterService?
    
    @IBOutlet weak var emailErrorLabel: UILabel!
    @IBOutlet weak var passwordErrorLabel: UILabel!
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var logoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        signInViewPresenter = SignInViewPresenter(delegate: self)
        signInButton.layer.cornerRadius = 8.0
        logoLabel.attributedText = Helper.getAttributedLogo()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func onSignInTapped(_ sender: Any) {
        self.signInViewPresenter?.signInWithEmailAndPassword(email: emailField.text!, password: passwordField.text!)
    }
    
    @IBAction func onCreateAcoountTapped(_ sender: Any) {
        self.signInViewPresenter?.onCreateAcoountTapped()
    }
    
}
