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
    
    var models: [(title: String, note: String)] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Notes"
        table.delegate = self
        table.dataSource = self
        let coreData = CoreDataService()
        let notes = coreData.getAllNotes()
        if(notes.count > 0){
            self.label.isHidden = true
            self.table.isHidden = false
            let allNotes = notes as! [Note]
            for note in allNotes {
                self.models.append((title: note.title! , note: note.note!))
                self.table.reloadData()
            }
        }
    }
}
