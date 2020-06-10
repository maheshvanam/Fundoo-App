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
        if let color = notification.userInfo?["color"]  as? UIColor {
            updateViews(color: color)
        }
    }
    
    @IBAction func onSlideUp(_ sender: Any) {
        heightAnchor.constant = 300
    }
 
    @IBAction func onPlusIconPressed(_ sender: Any) {
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        NotificationCenter.default.removeObserver(self)
        self.editNotePresenter.saveNote()
    }
}

extension EditNoteVC: EditNotePresenterDelegate {
    func initializeView(){
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
    }
    
    
    func updateViews(color: UIColor) {
        currentColor = colors.getKey(forValue: color)
            view.backgroundColor = color
            titleField.backgroundColor = color
            discriptionField.backgroundColor = color
            if note != nil {
                print("added color")
                note.color = currentColor
            }
    }
    
    func fieldsAreEmpty() -> Bool {
        if let title = titleField.text, !title.isEmpty ,!discriptionField.text.isEmpty {
            return true
        }
        return false
    }
    
    func isNewNote() -> Bool {
        if note == nil {
            return true
        }
        return false
    }
    
    func getNote() -> Note? {
        return note
    }
    
    func getTitleText()-> String {
        return titleField.text!
    }
    
    func getDiscriptionText()-> String {
        return discriptionField.text!
    }
    
    func getCurrentColor()-> String? {
       return currentColor
    }
    
    func postReloadCellsNotification() {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: Constants.RELOAD_CELLS), object: nil)
    }
}
