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

    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let layout = collectionView?.collectionViewLayout as? MosaicLayout {
            layout.delegate = self
        }
        collectionView.clipsToBounds = false
        notePresenter = NotePresenter(delegate: self)
        title = "Notes"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.notePresenter!.updateTableData()
    }
}
