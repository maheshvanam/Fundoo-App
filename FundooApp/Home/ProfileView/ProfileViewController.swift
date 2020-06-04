//
//  ProfileViewController.swift
//  FundooApp
//
//  Created by admin on 04/06/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet var profileLabel: UILabel!
    var profilePresenter: ProfileDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.profilePresenter = ProfilePresenter(delegate: self)
        self.profilePresenter?.fetchUserData()
    }
}
