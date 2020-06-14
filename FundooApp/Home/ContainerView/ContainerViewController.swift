//
//  ContainerViewController.swift
//  FundooApp
//
//  Created by admin on 02/06/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class ContainerViewController: UIViewController {
    
    private let sideMenuHidingConstant:CGFloat = 0
    private let sideMenuShowingConstant:CGFloat = -250
    
    @IBOutlet weak var leadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var profileItem: UIBarButtonItem!
    @IBOutlet weak var menuItem: UIBarButtonItem!
    @IBOutlet weak var container: UIView!
    
    @IBOutlet weak var gridButton: UIBarButtonItem!
    var isMenuOpen = false
    var isGrid = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.9395396113, green: 0.7086771131, blue: 0.1930754483, alpha: 1)
        addNotificationCenterObservers()
        profileItem.backgroundImage(for: .application, style: .plain, barMetrics:  .compact)
    }
    
    @IBAction func onSerchTapped(_ sender: Any) {
        let board = UIStoryboard(name: Constants.HOME_STORYBOARD, bundle: nil)
        guard let childVC =
            board.instantiateViewController(withIdentifier: "SearchVC") as? SearchVC  else {
          return
        }
        navigationController?.pushViewController(childVC, animated: false)
    }
    
    @IBAction func onGridViewTapped(_ sender: Any) {
        if isGrid {
            gridButton.image = UIImage(systemName: Constants.gridImage)
            isGrid = false
        }
        else{
            gridButton.image = UIImage(systemName: Constants.singleColumnImage)
            isGrid = true
        }
        NotificationCenter.default.post(name: Notification.Name(Constants.TOGGLE_GRID), object: nil)
    }
    
    @IBAction func onTakeANoteTapped(_ sender: Any) {
        switchToAddNote()
    }
    
    
    func addNotificationCenterObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(switchToNotes), name: Notification.Name(Constants.NAVIGATE_TO_NOTE), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(toggleSideMenu), name: Notification.Name(Constants.TOGGLE_MENU), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(switchToReminders), name: Notification.Name(Constants.NAVIGATE_TO_REMINDER), object: nil)
       }

    @IBAction func onMenuTapped(_ sender: Any) {
        toggleSideMenu()
    }
    
    
    
    @objc func toggleSideMenu() {
        if isMenuOpen {
            self.leadingConstraint.constant = sideMenuShowingConstant
            isMenuOpen = false
        }
        else {
            leadingConstraint.constant = sideMenuHidingConstant
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
        let board = UIStoryboard(name: Constants.HOME_STORYBOARD, bundle: nil)
        guard let childVC = board.instantiateViewController(withIdentifier: Constants.EDIT_NOTE_VC) as? EditNoteVC  else {
          return
        }
        childVC.noteIsNew = true
        childVC.modalPresentationStyle = .formSheet
        navigationController?.pushViewController(childVC, animated: false)
    }
    
    @objc func switchToReminders() {
        let board = UIStoryboard(name: Constants.HOME_STORYBOARD, bundle: nil)
        guard let childVC =
            board.instantiateViewController(withIdentifier: Constants.REMINDER_VC) as? ReminderViewController  else {
          return
        }
        navigationController?.pushViewController(childVC, animated: false)
    }
}


