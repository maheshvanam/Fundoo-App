//
//  SignInPresenterServiceImpl.swift
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
        
        let coreDataService = CoreDataService()
        //self.signViewDelegate.clearLabels()
        if email.isEmpty && password.isEmpty {
            self.signInViewDelegate.showAlert(title: "Error", message: "Please fill the all fields")
            return
        }
        do{
            let authenticationResult = try coreDataService.checkValidUserOrNot(email: email, password: password)
            
            if  authenticationResult == Result.SUCCESS {
                self.signInViewDelegate.clearFields()
                self.signInViewDelegate.clearLabels()
                self.signInViewDelegate.navigateToUserHomeView()
            }
            else if  authenticationResult == Result.INVALID_EMAIL {
                self.signInViewDelegate.showAlert(title: "Error", message: "Invalid email")
                self.signInViewDelegate.updateEmailLabel()
            }
            else{
                self.signInViewDelegate.showAlert(title: "Error", message: "invalid password")
                self.signInViewDelegate.updatePasswordLabel()
            }
        }
        catch{
            self.signInViewDelegate.showAlert(title: "Fetch Error", message: "Fetching data is failed...")
        }
    }
    
    func onCreateAcoountTapped()  {
        self.signInViewDelegate.navigateToSignUpView()
    }

}
