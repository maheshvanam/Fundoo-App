//
//  EditNoteVC.swift
//  FundooApp
//
//  Created by admin on 09/06/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class EditNoteVC: UIViewController {
    
    private let ediNoteTitle = "Edit Note"
    private let addNoteTitle = "Edit Note"
    private let backButtonTitle = "< Notes"
    private let slideUpMenuHidingConstant:CGFloat = 0
   private let slideUpMenuShowingConstant:CGFloat = 300
 
    @IBOutlet weak var discriptionField: UITextView!
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var heightAnchor: NSLayoutConstraint!
    var editNotePresenter: EditNoteDelegate!
    var note:Note!
    let colors = Constants.colors
    var currentColor:String!
    var slideUpVCpresenter = SlideUpVCPresenter()
    var noteIsNew:Bool!
    
    
    override func viewDidLoad() {
        initializeView()
        title = (noteIsNew == nil) ?  ediNoteTitle : addNoteTitle
        let swipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(onSwipDown))
        swipeGesture.direction = [.down]
        self.view.addGestureRecognizer(swipeGesture)
        editNotePresenter = EditNotePresenter(delegate: self)
        NotificationCenter.default.addObserver(self, selector: #selector(EditNoteVC.updateView), name: NSNotification.Name(rawValue: Constants.UPDATE_COLOR), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(deleteNote), name: NSNotification.Name(rawValue: Constants.DELETE_NOTE_KEY), object: nil)
        configureBackButton()
    }
    
    func configureBackButton(){
        let backButton = UIBarButtonItem(title: backButtonTitle, style: .plain, target: self, action: #selector(onBackPressed))
        navigationItem.leftBarButtonItem = backButton
        navigationItem.hidesBackButton = true
    }
    
    @objc func onBackPressed(){
        self.editNotePresenter.saveNote()
        NotificationCenter.default.removeObserver(self)
        noteIsNew = nil
        navigationController?.popViewController(animated: false)
    }
    
    @objc func onSwipDown() {
        heightAnchor.constant = slideUpMenuHidingConstant
    }
    
    @objc func deleteNote() {
        heightAnchor.constant = slideUpMenuHidingConstant
        slideUpVCpresenter.deleteNote(note: note)
        postReloadCellsNotification()
        NotificationCenter.default.removeObserver(self)
        navigationController?.popViewController(animated: false)
    }
    
    @IBAction func onSlideUp(_ sender: Any) {
        heightAnchor.constant = slideUpMenuShowingConstant
    }
    
    @objc func updateView(_ notification: NSNotification){
        if let color = notification.userInfo?[Constants.COLOR_KEY]  as? UIColor {
            updateViews(color: color)
        }
    }
 
    @IBAction func onPlusIconPressed(_ sender: Any) {
    }
    
    override func viewWillDisappear(_ animated: Bool) {
    }
}
