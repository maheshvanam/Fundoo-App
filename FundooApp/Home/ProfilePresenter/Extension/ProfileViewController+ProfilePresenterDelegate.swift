//
//  ProfileViewController+ProfilePresenterDelegate.swift
//  FundooApp
//
//  Created by admin on 04/06/20.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation

extension ProfileViewController: ProfilePresenterDelegate {
 
    func updateLabel(name:String,email:String) {
        self.nameLabel.text = name
        self.emailLabel.text = email
    }
}
