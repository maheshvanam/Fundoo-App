//
//  AddNoteViewController.swift
//  FundooApp
//
//  Created by admin on 03/06/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class AddNoteViewController: UIViewController {
    
    @IBOutlet var titleField: UITextField!
    @IBOutlet var noteField: UITextView!
    
    @IBOutlet weak var heightAnchor: NSLayoutConstraint!
    
    var addNotePresenter: AddNoteDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addNotePresenter = AddNotePresenter(delegate: self)
        title = Constants.ADD_NOTE
        noteField.layer.borderWidth = 1
        noteField.layer.borderColor = #colorLiteral(red: 0.9175666571, green: 0.9176985621, blue: 0.9175377488, alpha: 1)
    }
    
    @IBAction func onTapGesture(_ sender: Any) {
        self.heightAnchor.constant = 0
    }

    @IBAction func onSwipeUp(_ sender: Any) {
       self.heightAnchor.constant = 200
    }

    override func viewWillDisappear(_ animated: Bool) {
        if let title = titleField.text, !title.isEmpty ,!noteField.text.isEmpty {
            self.addNotePresenter!.insertNote(title: title, note: noteField.text)
        }
        titleField.text = ""
        noteField.text = ""
    }

}
