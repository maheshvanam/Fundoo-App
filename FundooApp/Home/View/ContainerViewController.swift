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
    
    @IBOutlet weak var profileItem: UIBarButtonItem!
    @IBOutlet weak var menuItem: UIBarButtonItem!
    @IBOutlet weak var container: UIView!
    var isMenuOpen = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.9395396113, green: 0.7086771131, blue: 0.1930754483, alpha: 1)
        configureProfileNavItem()
        addNotificationCenterObservers()
    }
    
    @IBAction func onTakeANoteTapped(_ sender: Any) {
        switchToAddNote()
    }
    
    @IBAction func onProfileClick(_ sender: Any) {
          guard let childVC = self.storyboard?.instantiateViewController(withIdentifier: "ProfileViewController") as? ProfileViewController else {
            return
          }
          addChild(childVC)
          childVC.view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
          childVC.view.frame = container.bounds
          container.addSubview(childVC.view)
          childVC.didMove(toParent: self)
    }
    
    func addNotificationCenterObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(switchToNotes), name: Notification.Name(Constants.NAVIGATE_TO_NOTE), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(toggleSideMenu), name: Notification.Name(Constants.TOGGLE_MENU), object: nil)
       }

    func configureProfileNavItem(){
        let email = UserDefaults.standard.string(forKey: Constants.EMAIL_KEY)
        profileItem.title = " \(email!.first?.uppercased() ?? "M")"
    }
    
    @IBAction func onMenuTapped(_ sender: Any) {
        toggleSideMenu()
    }
    
    @objc func toggleSideMenu() {
        if isMenuOpen {
            self.leadingConstraint.constant = -250
            isMenuOpen = false
        }
        else {
            leadingConstraint.constant = 0
            isMenuOpen = true
        }
    }
    
    @objc func switchToNotes(){
        guard let childVC = self.storyboard?.instantiateViewController(withIdentifier: "NoteViewController") as? NoteViewController  else {
          return
        }
        addChild(childVC)
        childVC.view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        childVC.view.frame = container.bounds
        container.addSubview(childVC.view)
        childVC.didMove(toParent: self)
    }
    
    @objc func switchToAddNote() {
        guard let childVC = self.storyboard?.instantiateViewController(withIdentifier: "AddNoteViewController") as? AddNoteViewController  else {
          return
        }
        navigationController?.pushViewController(childVC, animated: false)
    }
}


