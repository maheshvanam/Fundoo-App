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
        titleField.placeholder = "Title"
        titleField.becomeFirstResponder()
        NotificationCenter.default.addObserver(self, selector: #selector(onBackPressed), name: NSNotification.Name(Constants.UPDATE_NAV), object: nil)
    }
    
    @objc func onBackPressed() {
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(saveNote), userInfo: nil, repeats: false)
     }

    @objc func saveNote() {
        if let title = titleField.text, !title.isEmpty ,!noteField.text.isEmpty {
            let coreData = CoreDataService()
            coreData.insertNote(title: title, note: noteField.text)
        }
        titleField.text = ""
        noteField.text = ""
        tabBarController!.selectedIndex = 0
     }
    
    override func viewWillAppear(_ animated: Bool) {
        NotificationCenter.default.post(name: Notification.Name(Constants.SET_BACK_BUTTON), object: nil)
    }
}
