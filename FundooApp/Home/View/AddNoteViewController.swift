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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleField.becomeFirstResponder()
        noteField.layer.borderWidth = 1
        noteField.layer.borderColor = #colorLiteral(red: 0.9175666571, green: 0.9176985621, blue: 0.9175377488, alpha: 1)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        if let title = titleField.text, !title.isEmpty ,!noteField.text.isEmpty {
            let coreData = CoreDataService()
            coreData.insertNote(title: title, note: noteField.text)
        }
        titleField.text = ""
        noteField.text = ""
    }
}
