//
//  SignInViewPresenterServiceImpl.swift
//  FundooApp
//
//  Created by admin on 29/05/20.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation
import UIKit

class SignInViewPresenterServiceImpl: SignInViewPresenterService {
    
    var signInViewDelegate : PresenterSignInViewDelegate
    init(delegate: PresenterSignInViewDelegate) {
        self.signInViewDelegate = delegate
    }

    
    func signInWithEmailAndPassword(email: String,password: String) {
        
        let dbManager = UserDBManager(endpoint: "user/login")
        self.signInViewDelegate.clearLabels()
        if email.isEmpty && password.isEmpty {
            self.signInViewDelegate.showAlert(title: "Error", message: "Please fill the all fields")
            return
        }
        let user = UserResponse(email: email, password: password)
        dbManager.signInUser(user: user) { (result) in
            switch result {
            case .success(let currentUser):
                UserDefaults.standard.set(email, forKey:Constants.EMAIL_KEY)
                RunTimeDB.shared.setUser(user:currentUser)
                print(currentUser.firstName!)
                self.signInViewDelegate.clearFields()
                self.signInViewDelegate.clearLabels()
                self.signInViewDelegate.navigateToUserHomeView()
            case .failure(.decodingError):
                fatalError("decoding user data error")
            case .failure(.encodingError) :
                fatalError("encoding user data error")
            case .failure(.responseError):
                self.signInViewDelegate.showAlert(title: "Error", message: "invalid password")
                self.signInViewDelegate.updatePasswordLabel()
            }
        }
    }

    
    func onCreateAcoountTapped()  {
        self.signInViewDelegate.navigateToSignUpView()
    }

}
