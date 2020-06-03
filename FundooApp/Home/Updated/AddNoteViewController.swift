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
    
    var completion: ((String,String)-> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleField.becomeFirstResponder()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        if let title = titleField.text, !title.isEmpty ,!noteField.text.isEmpty {
            let coreData = CoreDataService()
            coreData.insertNote(title: title, note: noteField.text)
        }
    }
}
