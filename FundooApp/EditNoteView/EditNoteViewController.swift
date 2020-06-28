//
//  EditNoteVC.swift
//  FundooApp
//
//  Created by admin on 09/06/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit
import UserNotifications

let addReminderViewControllerId = "AddReminderViewController"
class EditNoteViewController: UIViewController {
    
    private let ediNoteTitle = "Edit Note"
    private let addNoteTitle = "Add Note"
    private let backButtonTitle = "< Notes"
    private let slideUpMenuHidingConstant:CGFloat = 0
   private let slideUpMenuShowingConstant:CGFloat = 300
 
    @IBOutlet weak var discriptionField: UITextView!
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var heightAnchor: NSLayoutConstraint!
    var editNotePresenter: EditNoteDelegate!
    var note:Note!
    var labels:[Label] = []
    let colors = Constants.colors
    var currentColor:String!
    var slideUpVCpresenter = SlideUpVCPresenter()
    var noteIsNew:Bool!
    var reminderDate:Date!
    
    override func viewDidLoad() {
        initializeView()
        title = (noteIsNew == nil) ?  ediNoteTitle : addNoteTitle
        let swipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(onSwipDown))
        swipeGesture.direction = [.down]
        self.view.addGestureRecognizer(swipeGesture)
        editNotePresenter = EditNotePresenter(delegate: self)
        configureNotificationCenters()
        configureBackButton()
    }
    @IBAction func onArchivePressed(_ sender: Any) {
        note.archive = !note.archive
        navigationController?.popViewController(animated: true)
    }
    
    func configureNotificationCenters(){
        NotificationCenter.default.addObserver(self, selector: #selector(EditNoteViewController.updateView), name: NSNotification.Name(rawValue: Constants.UPDATE_COLOR), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(onSwipDown), name: NSNotification.Name(rawValue: Constants.CLOSE_SLIDE_UP_MENU), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(deleteNote), name: NSNotification.Name(rawValue: Constants.DELETE_NOTE_KEY), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(addLabel), name: NSNotification.Name(rawValue: Constants.ADD_LABEL_KEY), object: nil)
    }
    
    func configureBackButton(){
        let backButton = UIBarButtonItem(title: backButtonTitle, style: .plain, target: self, action: #selector(onBackPressed))
        navigationItem.leftBarButtonItem = backButton
        navigationItem.hidesBackButton = true
    }
    
    func addLabelsToNote(){
        if (labels.count != 0) {
            editNotePresenter.addNoteToLabels(note:note,labels: labels)
            note.labels?.adding(labels)
        }
    }

    @objc func addLabel() {
        let board = UIStoryboard(name: Constants.FEATURES_STORYBOARD, bundle: nil)
        guard let childVC = board.instantiateViewController(withIdentifier: Constants.ADD_LABEL_VC) as? AddLabelViewController  else {
               return
             }
        childVC.addLabelsDelegate = self
        navigationController?.pushViewController(childVC, animated: false)
    }
    
    @objc func onBackPressed(){
        self.note.reminder = reminderDate
        self.addLabelsToNote()
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
        heightAnchor.constant = slideUpMenuShowingConstant
    }
}

extension EditNoteViewController: AddLabelsDelegate {
    func addLabels(items: [SelectableItem]) {
        labels = items.map({$0.item})
    }
}   
