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
    
    var models = [Note]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Notes"
        table.delegate = self
        table.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        loadData()
        
        NotificationCenter.default.post(name: Notification.Name(Constants.SET_MENU), object: nil)
    }
    
    func loadData() {
        models = []
        let coreData = CoreDataService()
        if let notes = coreData.getAllNotes() {
            self.label.isHidden = true
            self.table.isHidden = false
            let allNotes = notes as! [Note]
            models = allNotes
            self.table.reloadData()
        }
    }
}
