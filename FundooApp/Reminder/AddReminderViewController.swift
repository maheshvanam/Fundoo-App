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
    var date:Date!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.date=datePicker.date
    }
}
