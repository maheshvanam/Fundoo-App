//
//  NoteViewController+Extension.swift
//  FundooApp
//
//  Created by admin on 03/06/20.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation
import UIKit

private let reusabalCollectionCellId = "cell"
extension NoteViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return models.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = (collectionView.dequeueReusableCell(withReuseIdentifier: "NoteViewCell", for: indexPath) as! NoteViewCell)
         let noteModel = models[indexPath.item]
        cell.updateView(note:noteModel)
        cell.updateCellBackground(color: Constants.colors[noteModel.color!]!)
        
        let gesture = MyTapGesture(target: self, action:  #selector (onViewTouched(_:)))
        gesture.index = indexPath.item
        cell.reminderView.addGestureRecognizer(gesture)
        cell.setShadow()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let board = UIStoryboard(name: Constants.HOME_STORYBOARD, bundle: nil)
        guard let childVC = board.instantiateViewController(withIdentifier: Constants.EDIT_NOTE_VC) as? EditNoteViewController  else {
               return
             }
        childVC.note = models[indexPath.item]
        navigationController?.pushViewController(childVC, animated: false)
    }
    
    @objc func onViewTouched(_ sender:MyTapGesture){
    }
}

class MyTapGesture: UITapGestureRecognizer {
    var index = Int()
}
