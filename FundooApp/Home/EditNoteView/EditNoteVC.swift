//
//  EditNoteVC.swift
//  FundooApp
//
//  Created by admin on 09/06/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class EditNoteVC: UIViewController ,ColorDelegate{
 
    func UpdateColor(color: UIColor) {
        
    }
    
    
    @IBOutlet weak var discriptionField: UITextView!
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var heightAnchor: NSLayoutConstraint!
    
    var colorDelegate: ColorDelegate!
    var note:Note!
    let colors = Constants.colors
    
    override func viewDidLoad() {
        colorDelegate = self
        discriptionField.layer.borderWidth = 1
        discriptionField.layer.borderColor = #colorLiteral(red: 0.9175666571, green: 0.9176985621, blue: 0.9175377488, alpha: 1)
        titleField.text = note.title
        discriptionField.text = note.note
        if let color = note.color {
            view.backgroundColor = colors[color]
            titleField.backgroundColor = colors[color]
            discriptionField.backgroundColor = colors[color]
        }
        NotificationCenter.default.addObserver(self, selector: #selector(updateView), name: NSNotification.Name(rawValue: "load"), object: nil)
    }
    
    @objc func updateView(_ notification: NSNotification){
        if let color = notification.userInfo?["c"]  as? UIColor {
            view.backgroundColor = color
            titleField.backgroundColor = color
            discriptionField.backgroundColor = color
            note.color = colors.getKey(forValue: color)
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
        coreData.UpdateNote(note: note)
    }
}
