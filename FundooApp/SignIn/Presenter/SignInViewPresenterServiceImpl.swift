//
//  SignInViewPresenterServiceImpl.swift
//  FundooApp
//
//  Created by admin on 29/05/20.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation
import UIKit
import SwiftKeychainWrapper

class SignInViewPresenterServiceImpl: SignInViewPresenterService {
    private let backgroundQueueName = "backgroung"
    private let errorAlerttitle = "Error"
    private let emptyFieldsMessage = "Please fill the all fields"
    private let passwordErrorMessage = "invalid password"
    var signInViewDelegate : PresenterSignInViewDelegate
    
    init(delegate: PresenterSignInViewDelegate) {
        self.signInViewDelegate = delegate
    }
    
    
    func signInWithEmailAndPassword(email: String,password: String) {
        
        let dbManager = RemoteUserManager()
        self.signInViewDelegate.clearLabels()
        if email.isEmpty && password.isEmpty {
            self.signInViewDelegate.showAlert(title: errorAlerttitle, message: emptyFieldsMessage)
            return
        }
        let user = UserResponse(email: email, password: password)
        dbManager.signInUser(user: user) { [weak self](result) in
            switch result {
            case .success(let currentUser):
                let queue = DispatchQueue.init(label: self!.backgroundQueueName, qos:.background)
                queue.async {
                    UserDefaults.standard.set(true,forKey: Constants.IS_LOGGED_IN_KEY)
                    UserDefaults.standard.set(email, forKey:Constants.EMAIL_KEY)
                    UserDefaults.standard.setValue(currentUser.id!, forKey: RestConstants.authId)
                    UserDefaults.standard.setValue(currentUser.userId, forKey: RestConstants.uId)
                    self?.storeUserInfoInKeyChain(email: currentUser.email!, password: password, accessToken: currentUser.id!)
                }
                DispatchQueue.main.async {
                    self?.signInViewDelegate.clearFields()
                    self?.signInViewDelegate.clearLabels()
                    self?.signInViewDelegate.navigateToUserHomeView()
                }
            case .failure(.decodingError):
                fatalError(APIError.decodingErrorMessage)
            case .failure(.encodingError):
                fatalError(APIError.encodingErrorMessage)
            case .failure(.responseError):
                DispatchQueue.main.async {
                    self?.signInViewDelegate.showAlert(title: self!.errorAlerttitle, message:self!.passwordErrorMessage )
                    self?.signInViewDelegate.updatePasswordLabel()
                }
            }
            
        }
    }
    
    func onCreateAcoountTapped()  {
        self.signInViewDelegate.navigateToSignUpView()
    }
    
    func storeUserInfoInKeyChain(email:String,password:String,accessToken:String) {
        KeychainWrapper.standard.set(email, forKey: "email")
        KeychainWrapper.standard.set(password, forKey: "password")
        KeychainWrapper.standard.set(accessToken, forKey: "access_token")
    }
    
    func storeUserInfoInKeychain(email:String,password:String,accessToken:String) {
        KeychainWrapper.standard.set(email, forKey: UserInfoKey.EMAIL)
        KeychainWrapper.standard.set(password, forKey: UserInfoKey.PASSWORD)
        KeychainWrapper.standard.set(accessToken, forKey: UserInfoKey.ACCESS_TOKEN)
    }
}
