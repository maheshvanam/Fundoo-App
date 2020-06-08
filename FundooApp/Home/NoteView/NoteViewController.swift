//
//  NoteViewController.swift
//  FundooApp
//
//  Created by admin on 02/06/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class NoteViewController: UIViewController {

    var notePresenter: NoteDelegate?
    @IBOutlet var collectionView: UICollectionView!
    var models = [NoteModel]()
    var layout: MosaicLayout!
    var isGrid:Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layout = collectionView?.collectionViewLayout as? MosaicLayout
        layout.delegate = self
        collectionView.clipsToBounds = false
        notePresenter = NotePresenter(delegate: self)
        title = "Notes"
        NotificationCenter.default.addObserver(self, selector: #selector(toggleView), name: Notification.Name(Constants.TOGGLE_GRID), object: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.notePresenter!.updateTableData()
    }
    
    @objc func toggleView(){
        if isGrid {
            layout.setColumns(columns: 2)
            self.notePresenter!.updateTableData()
            isGrid = false
        }
        else {
            layout.setColumns(columns: 1)
            self.notePresenter!.updateTableData()
            isGrid = true
        }
    }
}
