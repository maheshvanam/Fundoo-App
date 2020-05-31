//
//  ViewController.swift
//  FundooApp
//
//  Created by admin on 24/05/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {
    
    var window: UIWindow?
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
        //self.signInViewPresenter?.signInWithEmailAndPassword(email: emailField.text!, password: passwordField.text!)
        window = UIWindow()
        window?.makeKeyAndVisible()
        window?.rootViewController = ContainerController()
        /*
        let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        guard let destinationViewController = mainStoryboard.instantiateViewController(identifier: "HomeController") as? HomeController else {
                 return
            }
        navigationController?.pushViewController(destinationViewController, animated: false)*/

    }
    
    @IBAction func onCreateAcoountTapped(_ sender: Any) {
        self.signInViewPresenter?.onCreateAcoountTapped()
        }
    
}
