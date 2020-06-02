//
//  MainViewController.swift
//  FundooApp
//
//  Created by admin on 02/06/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.post(name: Notification.Name("TOGGLE_MENU"),object: nil)
    }
    
    @IBAction func onMenuTapped(_ sender: Any) {
    }
}
