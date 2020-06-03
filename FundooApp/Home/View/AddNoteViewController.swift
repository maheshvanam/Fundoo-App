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
        titleField.layer.backgroundColor = UIColor.blue.cgColor
        //navigationController?.navigationBar.isHidden = true
        // NotificationCenter.default.post(name: Notification.Name("Save"), object: nil)
    }
    
    
    
    override func viewWillDisappear(_ animated: Bool) {
        if let title = titleField.text, !title.isEmpty ,!noteField.text.isEmpty {
            let coreData = CoreDataService()
            coreData.insertNote(title: title, note: noteField.text)
        }
    }
    override func viewDidDisappear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
    }
    override func viewWillAppear(_ animated: Bool) {
       // navigationController?.navigationBar.isHidden = true
    }
}
