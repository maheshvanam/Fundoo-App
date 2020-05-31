//
//  ContainerController.swift
//  FundooApp
//
//  Created by admin on 31/05/20.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation
import UIKit

class ContainerController: UIViewController {
    
    var menuController: UIViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureHomeController()
    }
    
    func configureHomeController() {
        let homeController = HomeController()
        homeController.delegate = self
        let controller = UINavigationController(rootViewController: homeController)
        view.addSubview(controller.view)
        addChild(controller)
        controller.didMove(toParent: self)
    }
    
    func configureMenuController() {
        if menuController == nil {
            menuController = MenuController()
            view.insertSubview(menuController.view, at: 0)
            addChild(menuController)
            menuController.didMove(toParent: self)
        }
    }
}
extension ContainerController: HomeControllerDelegate {
    func handleMenuToggle() {
        configureMenuController()
    }
}
