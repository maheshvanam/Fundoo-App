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
    
    @IBOutlet weak var container: UIView!
    
    var isMenuOpen = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(toggleSideMenu), name: Notification.Name("TOGGLE_MENU"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(navigateToNotes), name: NSNotification.Name("NOTES"), object: nil)
    }
    
    @IBAction func onMenuTapped(_ sender: Any) {
        toggleSideMenu()
    }
    
    @objc func toggleSideMenu(){
        if isMenuOpen {
            leadingConstraint.constant = -250
            isMenuOpen = false
        }
        else {
            leadingConstraint.constant = 0
            isMenuOpen = true
        }
    }
    
   @objc func navigateToNotes(){
    performSegue(withIdentifier: "notes", sender: nil)
//
//        guard let childVC = self.storyboard?.instantiateViewController(withIdentifier: "TabViewController") as? TabViewController else {
//          return
//        }
//        addChild(childVC)
//        childVC.view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
//        childVC.view.frame = container.bounds
//        container.addSubview(childVC.view)
//        childVC.didMove(toParent: self)
      }
}


