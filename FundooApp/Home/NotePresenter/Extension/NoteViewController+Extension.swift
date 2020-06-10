//
//  NoteViewController+Extension.swift
//  FundooApp
//
//  Created by admin on 03/06/20.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation
import UIKit

extension NoteViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return models.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = (collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! NoteCell)
         let noteModel = models[indexPath.item]
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.titleLabel?.text = noteModel.title
        cell.discriptionLabel?.text = noteModel.note
        
        if let color = noteModel.color {
            cell.backgroundColor = Constants.colors[color]
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
         let board = UIStoryboard(name: "Home", bundle: nil)
             guard let childVC = board.instantiateViewController(withIdentifier: "EditNoteVC") as? EditNoteVC  else {
               return
             }
        childVC.note = models[indexPath.item]
        navigationController?.pushViewController(childVC, animated: false)
      }
}
