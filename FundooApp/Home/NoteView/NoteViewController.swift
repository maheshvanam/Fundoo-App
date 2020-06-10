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
    var models = [Note]()
    var layout: MosaicLayout!
    var isGrid:Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layout = collectionView?.collectionViewLayout as? MosaicLayout
        layout.delegate = self
        collectionView.clipsToBounds = false
        collectionView.contentInset = UIEdgeInsets(top: Constants.FLOAT_TEN, left: Constants.FLOAT_TEN, bottom: Constants.FLOAT_TEN, right: Constants.FLOAT_TEN)
        notePresenter = NotePresenter(delegate: self)
        title = Constants.NOTES_TITLE
        NotificationCenter.default.addObserver(self, selector: #selector(toggleView), name: Notification.Name(Constants.TOGGLE_GRID), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(reloadCells), name: Notification.Name(Constants.RELOAD_CELLS), object: nil)
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
    
    @objc func reloadCells(){
        self.notePresenter!.updateTableData()
    }
}
