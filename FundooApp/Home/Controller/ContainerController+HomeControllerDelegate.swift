//
//  ContainerController+HomeControllerDelegate.swift
//  FundooApp
//
//  Created by admin on 01/06/20.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation

extension ContainerController: HomeControllerDelegate {
    
    func handleMenuToggle(forMenuOprion menuOption: MenuOption?) {
       
        if !isExpanded {
            configureMenuController()
        }
        
        isExpanded = !isExpanded
        animatePanel(shouldExpand: isExpanded, menuOption: menuOption)
    }
}
