//
//  EditNoteVC+Extension.swift
//  FundooApp
//
//  Created by admin on 11/06/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

extension EditNoteViewController: EditNotePresenterDelegate {
    func initializeView(){
        discriptionField.layer.borderWidth = 1
        discriptionField.layer.borderColor = #colorLiteral(red: 0.9175666571, green: 0.9176985621, blue: 0.9175377488, alpha: 1)
        if note != nil {
            titleField.text = note.title
            discriptionField.text = note.description
            let color = note.color
            view.backgroundColor = colors[color!]
            titleField.backgroundColor = colors[color!]
            discriptionField.backgroundColor = colors[color!]
        }
    }
    
    
    func updateViews(color: UIColor) {
        currentColor = colors.getKey(forValue: color)
            view.backgroundColor = color
            titleField.backgroundColor = color
            discriptionField.backgroundColor = color
            if note != nil {
                note.color = currentColor
            }
    }
    
    func fieldsAreEmpty() -> Bool {
        if let title = titleField.text, !title.isEmpty ,!discriptionField.text.isEmpty {
            return false
        }
        return true
    }
    
    func isNewNote() -> Bool {
        return (noteIsNew != nil) ? true : false
    }
    
    
    func getNote() -> NoteResponse? {
        return note
    }
    
    func getTitleText()-> String {
        return titleField.text!
    }
    
    func getDiscriptionText()-> String {
        return discriptionField.text!
    }
    
    func getCurrentColor()-> String? {
        if currentColor == nil {
            currentColor = "white"
        }
       return currentColor
    }
    
    func postReloadCellsNotification() {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: Constants.RELOAD_CELLS), object: nil)
    }
}
