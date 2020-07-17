//
//  AddReminderViewController.swift
//  FundooApp
//
//  Created by admin on 23/06/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class AddReminderViewController: UIViewController {
    
    @IBOutlet var datePicker:UIDatePicker!
    
    @IBOutlet weak var deleteButton: UIButton!
    var hideButton:Bool = false
    var addReminderDelegate:AddReminderDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        deleteButton.isHidden = hideButton
    }
    
    @IBAction func didSetReminderTapped(_ sender: Any) {
        let date=datePicker.date
        addReminderDelegate?.addReminder(date: date)
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func onDeleteReminderTapped(_ sender: Any) {
        addReminderDelegate?.removeReminder()
        navigationController?.popViewController(animated: true)
    }
}

protocol AddReminderDelegate {
    func addReminder(date: Date)
    func removeReminder()
}
