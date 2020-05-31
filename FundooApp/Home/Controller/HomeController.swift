//
//  UserHomeController.swift
//  FundooApp
//
//  Created by admin on 26/05/20.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation
import UIKit

class HomeController : UIViewController{
    
    var delegate: HomeControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureNavigationBar()
    }
    
    func configureNavigationBar() {
        title = "Notes"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.navigationBar.barTintColor = .darkGray
        navigationController?.navigationBar.tintColor = .white
        navigationItem.setHidesBackButton(true, animated: false)
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(onSearchButtonTapped))
        navigationItem.leftBarButtonItem = UIBarButtonItem(image:#imageLiteral(resourceName: "menu").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(onMenuButtonTapped))
    }
    
    @objc func onSearchButtonTapped() {
    }
    
    @objc func onMenuButtonTapped(){
        delegate?.handleMenuToggle(forMenuOprion: nil)
    }
}

