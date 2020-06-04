//
//  NoteViewController.swift
//  FundooApp
//
//  Created by admin on 02/06/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class NoteViewController: UIViewController {
    
    @IBOutlet var table: UITableView!
    @IBOutlet var label: UILabel!
    
    var notePresenter: NoteDelegate?
    var models = [NoteModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        notePresenter = NotePresenter(delegate: self)
        title = "Notes"
        table.delegate = self
        table.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.notePresenter!.updateTableData()
        NotificationCenter.default.post(name: Notification.Name(Constants.SET_MENU), object: nil)
    }
}
