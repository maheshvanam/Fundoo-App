//
//  SideMenuPresenter.swift
//  FundooApp
//
//  Created by admin on 25/06/20.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation

class SideMenuPresenter:SideMenuPresenterDelegate {
    
    let dbManager = DatabaseManager()
    
    func signOutUser(){
        dbManager.signOutUser()
    }
}
