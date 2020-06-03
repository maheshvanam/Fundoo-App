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
        
        guard let addNoteVC = storyboard?.instantiateViewController(identifier: "AddNoteViewController") as? AddNoteViewController else{
                    return
                }
                
                addNoteVC.title = "New Note"
               addNoteVC.completion = {
                   noteTitle,note in self.models.append((title: noteTitle,note: note))
                   self.label.isHidden = true
                   self.table.isHidden = false
                   self.table.reloadData()
               }
    }
    
    @IBAction func didTapNewNotes(){
         guard let addNoteVC = storyboard?.instantiateViewController(identifier: "AddNoteViewController") as? AddNoteViewController else{
             return
         }
         
         addNoteVC.title = "New Note"
        addNoteVC.completion = {
            noteTitle,note in self.models.append((title: noteTitle,note: note))
            self.label.isHidden = true
            self.table.isHidden = false
            self.table.reloadData()
        }
         navigationController?.pushViewController(addNoteVC,animated: false )
    }
}

extension NoteViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = models[indexPath.row].title
        cell.detailTextLabel?.text = models[indexPath.row].note
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
    }

}
