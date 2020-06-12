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
    var longPressGesture: UILongPressGestureRecognizer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = Constants.NOTES_TITLE
        layout = collectionView?.collectionViewLayout as? MosaicLayout
        layout.delegate = self
        collectionView.clipsToBounds = false
        collectionView.contentInset = UIEdgeInsets(top: Constants.FLOAT_TEN, left: Constants.FLOAT_TEN, bottom: Constants.FLOAT_TEN, right: Constants.FLOAT_TEN)
        notePresenter = NotePresenter(delegate: self)
        addLongPressGesture()
        addNotificationObservers()
    }
    
    @objc func handleLongPressGesture(gesture: UILongPressGestureRecognizer) {
         switch(gesture.state) {
         case UIGestureRecognizerState.began:
            guard let selectedIndexPath = self.collectionView?.indexPathForItem(at: gesture.location(in: self.collectionView)) else {
                    break
                }
                collectionView?.beginInteractiveMovementForItem(at: selectedIndexPath)
         case UIGestureRecognizerState.changed:
            collectionView?.updateInteractiveMovementTargetPosition(gesture.location(in: gesture.view!))
         case UIGestureRecognizerState.ended:
                collectionView?.endInteractiveMovement()
            default:
                collectionView?.cancelInteractiveMovement()
//            case .began:
//                guard let selectedIndexPath = collectionView.indexPathForItem(at: gesture.location(in: collectionView)) else {
//                    break
//                }
//                collectionView.beginInteractiveMovementForItem(at: selectedIndexPath)
//            case .changed:
//                collectionView.updateInteractiveMovementTargetPosition(gesture.location(in: gesture.view!))
//            case .ended:
//                collectionView.endInteractiveMovement()
//            default:
//                collectionView.cancelInteractiveMovement()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.notePresenter!.updateTableData()
    }
    
    @objc func toggleView(){
        let col: CGFloat = isGrid ? Constants.FLOAT_2 : Constants.FLOAT_ZERO
        layout.setColumns(columns: col)
        isGrid = !isGrid
        self.notePresenter!.updateCells()
    }
    
    @objc func reloadCells(){
        self.notePresenter!.updateTableData()
    }
}
