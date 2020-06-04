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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let data = CoreDataService()
        let email = UserDefaults.standard.string(forKey: Constants.EMAIL_KEY)
        let user = data.getUser(email: email!)
        profileLabel.text = user.firstName
    }
}
