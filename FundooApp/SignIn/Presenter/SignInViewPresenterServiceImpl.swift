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
        
        let dbManager = RemoteUserManager()
        self.signInViewDelegate.clearLabels()
        if email.isEmpty && password.isEmpty {
            self.signInViewDelegate.showAlert(title: "Error", message: "Please fill the all fields")
            return
        }
        let user = UserResponse(email: email, password: password)
        dbManager.signInUser(user: user) { (result) in
            switch result {
            case .success(let currentUser):
                let thread = DispatchQueue.init(label: "myThread", qos:.background)
                thread.async {
                    UserDefaults.standard.set(email, forKey:Constants.EMAIL_KEY)
                    UserDefaults.standard.setValue(currentUser.id!, forKey: RestConstants.authId)
                    UserDefaults.standard.setValue(currentUser.userId, forKey: RestConstants.uId)
                }
                DispatchQueue.main.async {
                    self.signInViewDelegate.clearFields()
                    self.signInViewDelegate.clearLabels()
                    self.signInViewDelegate.navigateToUserHomeView()
                }
            case .failure(.decodingError):
                fatalError(APIError.decodingErrorMessage)
            case .failure(.encodingError):
                fatalError(APIError.encodingErrorMessage)
            case .failure(.responseError):
                DispatchQueue.main.async {
                    self.signInViewDelegate.showAlert(title: "Error", message: "invalid password")
                    self.signInViewDelegate.updatePasswordLabel()
                }
            }
            
        }
    }
    
    func onCreateAcoountTapped()  {
        self.signInViewDelegate.navigateToSignUpView()
    }
    
}
