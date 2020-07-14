//
//  SideMenuPresenter.swift
//  FundooApp
//
//  Created by admin on 25/06/20.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation
import SwiftKeychainWrapper

class SideMenuPresenter:SideMenuPresenterDelegate {
    
    let dbManager = RemoteLabelManager.shared
    func getLabels(callback:@escaping([LabelResponse])->Void) {
        dbManager.getLabels(urlPath: RestUrl.GET_LABEL_LIST_URL_PATH) { (labels) in
            DispatchQueue.main.async {
                callback(labels)
            }
        }
    }
    
    func signOutUser() {
        UserDefaults.standard.set("", forKey: Constants.EMAIL_KEY)
        UserDefaults.standard.set(false, forKey: Constants.IS_LOGGED_IN_KEY)
        KeychainWrapper.standard.removeAllKeys()
    }
    
}
