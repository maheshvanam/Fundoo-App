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
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.titleLabel?.text = models[indexPath.item].title
        cell.discriptionLabel?.text = models[indexPath.item].note
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
         let board = UIStoryboard(name: "Home", bundle: nil)

             guard let childVC = board.instantiateViewController(withIdentifier: "AddNoteViewController") as? AddNoteViewController  else {
               return
             }
             navigationController?.pushViewController(childVC, animated: false)
      }
}
