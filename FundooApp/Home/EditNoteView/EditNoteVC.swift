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
    var editNotePresenter: EditNoteDelegate!
    var note:Note!
    let colors = Constants.colors
    var currentColor:String!
    
    override func viewDidLoad() {
        initializeView()
        editNotePresenter = EditNotePresenter(delegate: self)
        NotificationCenter.default.addObserver(self, selector: #selector(EditNoteVC.updateView), name: NSNotification.Name(rawValue: Constants.UPDATE_COLOR), object: nil)
    }
    
    @objc func updateView(_ notification: NSNotification){
        if let color = notification.userInfo?[Constants.COLOR_KEY]  as? UIColor {
            updateViews(color: color)
        }
    }
    
    @IBAction func onSlideUp(_ sender: Any) {
        heightAnchor.constant = Constants.HEIGHT_ANCHOR_300
    }
 
    @IBAction func onPlusIconPressed(_ sender: Any) {
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        NotificationCenter.default.removeObserver(self)
        self.editNotePresenter.saveNote()
    }
}
