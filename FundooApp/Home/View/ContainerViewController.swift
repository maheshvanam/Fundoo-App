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
    
    @IBOutlet weak var menuItem: UIBarButtonItem!
    @IBOutlet weak var container: UIView!
    
    var isMenuOpen = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.barTintColor = .lightGray
        NotificationCenter.default.addObserver(self, selector: #selector(toggleSideMenu), name: Notification.Name("TOGGLE_MENU"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(setBackButton), name: NSNotification.Name("SET_BACK_BUTTON"), object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(updateNavBar), name: NSNotification.Name("SET_MENU"), object: nil)
    }
    
    @IBAction func onMenuTapped(_ sender: Any) {
        toggleSideMenu()
    }
    
    @objc func setBackButton() {
        let backButton = UIBarButtonItem(image:UIImage(named: "back"), style: .plain, target: self, action: #selector(setMenuButton))
        navigationItem.setLeftBarButton(backButton,animated: false)
        navigationItem.leftBarButtonItem?.tintColor = UIColor.white
    }
    @objc func updateNavBar(){
        let menuButton = UIBarButtonItem(image:UIImage(named: "menu"), style: .plain, target: self, action: #selector(toggleSideMenu))
        navigationItem.setLeftBarButton(menuButton,animated: false)
        navigationItem.leftBarButtonItem?.tintColor = UIColor.white
    }
    
    @objc func setMenuButton(){
        updateNavBar()
        NotificationCenter.default.post(name: Notification.Name("UPDATE_NAV"), object: nil)
    }
    
    @objc func toggleSideMenu(){
        if isMenuOpen {
            self.leadingConstraint.constant = -250
            isMenuOpen = false
        }
        else {
            leadingConstraint.constant = 0
            isMenuOpen = true
        }
    }
}


