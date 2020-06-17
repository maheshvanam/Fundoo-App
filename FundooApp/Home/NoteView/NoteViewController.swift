//
//  NoteViewController.swift
//  FundooApp
//
//  Created by admin on 02/06/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class NoteViewController: UIViewController {
    
    private let topInset:CGFloat = 10
    private let bottomInset:CGFloat = 10
    private let leftInset:CGFloat = 10
    private let rightInset:CGFloat = 10
    let titleHeight:CGFloat = 10
    let initialSection = 0
    let firstIndexPath = 0
    let fontSizeOfDiscription:CGFloat = 15
    let widthOfDiscriptionField:CGFloat = 190
    let maxContentHeight:CGFloat = 350
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
        collectionView.contentInset = UIEdgeInsets(top: topInset , left: leftInset, bottom: bottomInset, right: rightInset)
        notePresenter = NotePresenter(delegate: self)
        addNotificationObservers()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.notePresenter!.updateDataSource()
    }
    
    @objc func toggleView(){
        let col: CGFloat = isGrid ? 2 : 1
        layout.setColumns(columns: col)
        isGrid = !isGrid
        self.notePresenter!.updateCells()
    }
    
    @objc func reloadCells(){
        self.notePresenter!.updateDataSource()
    }
}
