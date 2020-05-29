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
    
    var signViewDelegate : PresenterSignInViewDelegate
       init(delegate: PresenterSignInViewDelegate) {
           self.signViewDelegate = delegate
       }
    
    func signInWithEmailAndPassword(email: String,password: String) {
        
        let coreDataService = CoreDataService()
        self.signViewDelegate.clearLabels()
        if email.isEmpty && password.isEmpty {
            self.signViewDelegate.showAlert(title: "Error", message: "Please fill the all fields")
            return
        }
        do{
            let authenticationResult = try coreDataService.checkValidUserOrNot(email: email, password: password)
            
            if  authenticationResult == Result.SUCCESS {
                self.signViewDelegate.clearLabels()
                self.signViewDelegate.navigateToUserHomeView()
            }
            else if  authenticationResult == Result.INVALID_EMAIL {
                self.signViewDelegate.showAlert(title: "Error", message: "Invalid email")
                self.signViewDelegate.updateEmailLabel()
            }
            else{
                self.signViewDelegate.showAlert(title: "Error", message: "invalid password")
                self.signViewDelegate.updatePasswordLabel()
            }
        }
        catch{
            self.signViewDelegate.showAlert(title: "Fetch Error", message: "Fetching data is failed...")
        }
    }
    
    func onCreateAcoountTapped()  {
        self.signViewDelegate.navigateToSignUpView()
    }

}
