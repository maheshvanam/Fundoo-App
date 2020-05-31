//
//  UserHomeController.swift
//  FundooApp
//
//  Created by admin on 26/05/20.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation
import UIKit
class UserHomeController : UIViewController{
    
    override func viewDidLoad() {
        title = "Notes"
        navigationItem.setHidesBackButton(true, animated: false)
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(onSearchButtonTapped))
    }
    
    @objc func onSearchButtonTapped(){
        
    }
}
