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
    var slideUpVCpresenter = SlideUpVCPresenter()
    
    override func viewDidLoad() {
        initializeView()
        let swipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(onSwipDown))
        swipeGesture.direction = [.down]
        self.view.addGestureRecognizer(swipeGesture)
        editNotePresenter = EditNotePresenter(delegate: self)
        NotificationCenter.default.addObserver(self, selector: #selector(EditNoteVC.updateView), name: NSNotification.Name(rawValue: Constants.UPDATE_COLOR), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(deleteNote), name: NSNotification.Name(rawValue: Constants.DELETE_NOTE_KEY), object: nil)
        
    }
    
    @objc func onSwipDown() {
        heightAnchor.constant = Constants.FLOAT_ZERO
    }
    
    @objc func deleteNote() {
        heightAnchor.constant = Constants.FLOAT_ZERO
        slideUpVCpresenter.deleteNote(note: note)
        note = nil
        postReloadCellsNotification()
        navigationController?.popViewController(animated: false)
    }
    
    @IBAction func onSlideUp(_ sender: Any) {
        heightAnchor.constant = Constants.HEIGHT_ANCHOR_300
    }
    
    @objc func updateView(_ notification: NSNotification){
        if let color = notification.userInfo?[Constants.COLOR_KEY]  as? UIColor {
            updateViews(color: color)
        }
    }
 
    @IBAction func onPlusIconPressed(_ sender: Any) {
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        NotificationCenter.default.removeObserver(self)
        if(note != nil){
            self.editNotePresenter.saveNote()
        }
    }
}
