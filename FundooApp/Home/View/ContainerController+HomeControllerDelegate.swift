//
//  ContainerController+HomeControllerDelegate.swift
//  FundooApp
//
//  Created by admin on 01/06/20.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation

extension ContainerController: HomeControllerDelegate {
    func handleMenuToggle() {
        if !isExpanded {
            configureMenuController()
        }
        
        isExpanded = !isExpanded
        showMenuController(shouldExpand: isExpanded)
    }
}
