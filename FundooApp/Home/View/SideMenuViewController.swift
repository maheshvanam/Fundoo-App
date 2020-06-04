//
//  SideMenuViewController.swift
//  FundooApp
//
//  Created by admin on 02/06/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class SideMenuViewController: UITableViewController {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        NotificationCenter.default.post(name: Notification.Name(Constants.TOGGLE_MENU), object: nil)
        switch indexPath.row {
        case Constants.HOME:
            NotificationCenter.default.post(name: Notification.Name(Constants.NAVIGATE_TO_HOME), object: nil)
        case Constants.SIGN_OUT:
            UserDefaults.standard.set("", forKey: Constants.EMAIL_KEY)
            UserDefaults.standard.set(false, forKey: Constants.IS_LOGGED_IN_KEY)
            self.navigationController?.popToRootViewController(animated: false)
        default:
            NotificationCenter.default.post(name: Notification.Name(Constants.NAVIGATE_TO_HOME), object: nil)
        }
    }
}
