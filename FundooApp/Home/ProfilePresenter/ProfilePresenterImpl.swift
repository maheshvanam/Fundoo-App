//
//  ProfilePresenterImpl.swift
//  FundooApp
//
//  Created by admin on 04/06/20.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation
class ProfilePresenterImpl: ProfileDelegate {
    
    var profileView : ProfilePresenterDelegate
    
    init(delegate: ProfilePresenterDelegate) {
           self.profileView = delegate
    }
    
    func fetchUserData() {
        let data = DatabaseManager()
        let email = UserDefaults.standard.string(forKey: Constants.EMAIL_KEY)
        do {
            let user = try data.getUser(email: email!)
            self.profileView.updateLabel(user: user)
        }
        catch CoreDataError.UserNotFound {
            fatalError(Constants.USER_NOT_FOUND)
        }
        catch{
            fatalError(Constants.FETCH_ERROR)
        }
    }
}
