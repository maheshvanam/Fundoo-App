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
        case 1:
            NotificationCenter.default.post(name: Notification.Name("NOTES"), object: nil)
        default:
            NotificationCenter.default.post(name: Notification.Name("HOME"), object: nil)
        }
    }
}
