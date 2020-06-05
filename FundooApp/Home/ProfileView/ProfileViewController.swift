//
//  ProfileViewController.swift
//  FundooApp
//
//  Created by admin on 04/06/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    var profilePresenter: ProfileDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.profilePresenter = ProfilePresenter(delegate: self)
        self.profilePresenter?.fetchUserData()
        let gesture = UITapGestureRecognizer(target: self, action: #selector(onViewTouched))
        self.view.addGestureRecognizer(gesture)
    }
    
    @objc func onViewTouched(){
        dismiss(animated: true, completion: nil)
    }
    
}
