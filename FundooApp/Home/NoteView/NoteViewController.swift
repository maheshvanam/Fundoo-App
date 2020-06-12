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
        title = Constants.NOTES_TITLE
        layout = collectionView?.collectionViewLayout as? MosaicLayout
        layout.delegate = self
        collectionView.dragInteractionEnabled = true
        collectionView.dragDelegate = self
        collectionView.dropDelegate = self
        collectionView.clipsToBounds = false
        collectionView.contentInset = UIEdgeInsets(top: Constants.FLOAT_TEN, left: Constants.FLOAT_TEN, bottom: Constants.FLOAT_TEN, right: Constants.FLOAT_TEN)
        notePresenter = NotePresenter(delegate: self)
        addNotificationObservers()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.notePresenter!.updateTableData()
    }
    
    @objc func toggleView(){
        let col: CGFloat = isGrid ? Constants.FLOAT_2 : Constants.FLOAT_1
        layout.setColumns(columns: col)
        isGrid = !isGrid
        self.notePresenter!.updateCells()
    }
    
    @objc func reloadCells(){
        self.notePresenter!.updateTableData()
    }
}
