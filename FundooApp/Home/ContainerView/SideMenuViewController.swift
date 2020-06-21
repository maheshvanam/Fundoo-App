//
//  SideMenuViewController.swift
//  FundooApp
//
//  Created by admin on 02/06/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class SideMenuViewController: UITableViewController {
   
    override func viewDidLoad() {
        tableView.backgroundColor = #colorLiteral(red: 0.9395396113, green: 0.7086771131, blue: 0.1930754483, alpha: 1)
        }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        postNotification(key: Constants.TOGGLE_MENU)
        let option = SideMenuOption(rawValue: indexPath.item)
        switch  option {
            case .notes:
                postNotification(key: Constants.NAVIGATE_TO_NOTE)
            case .reminder:
                postNotification(key: Constants.NAVIGATE_TO_REMINDER)
            case .newLabel: postNotification(key:       Constants.NAVIGATE_TO_LABELS)
            case .signOut:
                UserDefaults.standard.set("", forKey: Constants.EMAIL_KEY)
                UserDefaults.standard.set(false, forKey: Constants.IS_LOGGED_IN_KEY)
                self.navigationController?.popToRootViewController(animated: false)
            default:
                postNotification(key: Constants.NAVIGATE_TO_REMINDER)
        }
    }
    
    func postNotification(key: String){
        NotificationCenter.default.post(name: Notification.Name(key), object: nil)
    }
}
