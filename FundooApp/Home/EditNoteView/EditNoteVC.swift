//
//  EditNoteVC.swift
//  FundooApp
//
//  Created by admin on 09/06/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class EditNoteVC: UIViewController {
    
    @IBOutlet weak var discriptionField: UITextView!
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var heightAnchor: NSLayoutConstraint!
    var note:Note!
    override func viewDidLoad() {
        discriptionField.layer.borderWidth = 1
        discriptionField.layer.borderColor = #colorLiteral(red: 0.9175666571, green: 0.9176985621, blue: 0.9175377488, alpha: 1)
    }
    
    @IBAction func onSlideUp(_ sender: Any) {
        heightAnchor.constant = 300
    }
    
//    @IBAction func onViewTapped(_ sender: Any) {
//        heightAnchor.constant = 0
//    }
    
    @IBAction func onPlusIconPressed(_ sender: Any) {
    }
}

