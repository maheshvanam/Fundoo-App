//
//  ContainerViewController.swift
//  FundooApp
//
//  Created by admin on 02/06/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class ContainerViewController: UIViewController {

    @IBOutlet weak var leadingConstraint: NSLayoutConstraint!
    var isMenuOpen = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
         NotificationCenter.default.addObserver(self, selector: #selector(toggleSideMenu), name: Notification.Name("TOGGLE_MENU"), object: nil)
    }
    
    @objc func toggleSideMenu(){
        if isMenuOpen {
            leadingConstraint.constant = -250
            isMenuOpen = true
        }
        else {
            leadingConstraint.constant = 0
            isMenuOpen = false
        }
    }
}
