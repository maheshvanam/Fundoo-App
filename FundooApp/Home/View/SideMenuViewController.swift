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
        NotificationCenter.default.post(name: Notification.Name("TOGGLE_MENU"), object: nil)
        switch indexPath.row {
        case 0:
            NotificationCenter.default.post(name: Notification.Name("NOTES"), object: nil)
        case 5:
            UserDefaults.standard.set(false, forKey: "IS_LOGGED_IN")
            self.navigationController?.popToRootViewController(animated: false)
        default:
            NotificationCenter.default.post(name: Notification.Name("NOTES"), object: nil)
        }
    }
}
