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
    let colors = Constants.colors
    var currentColor:String!
    
    override func viewDidLoad() {
        discriptionField.layer.borderWidth = 1
        discriptionField.layer.borderColor = #colorLiteral(red: 0.9175666571, green: 0.9176985621, blue: 0.9175377488, alpha: 1)
        if note != nil {
            titleField.text = note.title
            discriptionField.text = note.note
            if let color = note.color {
                view.backgroundColor = colors[color]
                titleField.backgroundColor = colors[color]
                discriptionField.backgroundColor = colors[color]
            }
        }
        NotificationCenter.default.addObserver(self, selector: #selector(updateView), name: NSNotification.Name(rawValue: Constants.UPDATE_COLOR), object: nil)
    }
    
    @objc func updateView(_ notification: NSNotification){
        if let color = notification.userInfo?["c"]  as? UIColor {
            currentColor = colors.getKey(forValue: color)
            view.backgroundColor = color
            titleField.backgroundColor = color
            discriptionField.backgroundColor = color
        }
    }
    
    @IBAction func onSlideUp(_ sender: Any) {
        heightAnchor.constant = 300
    }
    
//    @IBAction func onViewTapped(_ sender: Any) {
//        heightAnchor.constant = 0
//    }
    
    @IBAction func onPlusIconPressed(_ sender: Any) {
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        let coreData = CoreDataService()
        if let title = titleField.text, !title.isEmpty ,!discriptionField.text.isEmpty {
            
            if note == nil {
                note = coreData.createNote()
                note.creationTime = Date()
                note.title = titleField.text
                note.note = discriptionField.text
                coreData.insertNote(note: note)
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: Constants.RELOAD_CELLS), object: nil)
                return
            }
            note.title = titleField.text
            note.note = discriptionField.text
        }
        else{
            return
        }
        note.editTime = Date()
        note.color = currentColor
        coreData.insertNote(note: note)
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: Constants.RELOAD_CELLS), object: nil)
    }
}
