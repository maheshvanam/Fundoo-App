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
        if indexPath.row == 5 {
            UserDefaults.standard.set("", forKey: Constants.EMAIL_KEY)
            UserDefaults.standard.set(false, forKey: Constants.IS_LOGGED_IN_KEY)
            self.navigationController?.popToRootViewController(animated: false)
        }
    }
    
}
