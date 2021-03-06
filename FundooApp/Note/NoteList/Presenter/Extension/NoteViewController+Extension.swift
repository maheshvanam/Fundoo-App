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
        let color = noteModel.color
        if !color.isEmpty {
            if let noteColor = Constants.colors[color] {
            cell.updateCellBackground(color: noteColor)
            }
        }
        else {
            cell.updateCellBackground(color: Constants.colors["#FFFFFF"]!)
        }
        cell.setShadow()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if viewOption == isTrashView {
            showAlert(note: models[indexPath.item])
            self.reloadCells()
        }
        else {
        
        let board = UIStoryboard(name: Constants.HOME_STORYBOARD, bundle: nil)
            guard let childVC = board.instantiateViewController(withIdentifier: Constants.EDIT_NOTE_VC) as? EditNoteViewController  else {
                return
            }
            childVC.note = models[indexPath.item]
            navigationController?.pushViewController(childVC, animated: false)
        }
    }
    
    func showAlert(note :NoteResponse){
        let message             = "you can't edit the trashed notes"
        let title               = "Trash"
        let restoreButtonTitle  = "Restore"
        let deleteButtonTitle   = "Delete"
        
        let alertController = UIAlertController(title: title, message: message , preferredStyle: .alert)
        
        let OKAction = UIAlertAction(title: restoreButtonTitle, style: .default) { (action:UIAlertAction!) in
            self.notePresenter?.restoreFromTrash(note:note)
            
        }
        alertController.addAction(OKAction)
        let cancelAction = UIAlertAction(title: deleteButtonTitle, style: .cancel) { (action:UIAlertAction!) in
          self.notePresenter?.deleteNote(note: note)
        }
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion:nil)
    }
}
