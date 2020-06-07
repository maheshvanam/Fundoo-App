//
//  NoteViewController+Extension.swift
//  FundooApp
//
//  Created by admin on 03/06/20.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation
import UIKit

extension NoteViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return models.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! NoteCell
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.titleLabel?.text = models[indexPath.row].title
        cell.noteLabel?.text = models[indexPath.row].note
        return cell
    }
}

extension NoteViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let numberOfColumns:CGFloat = 2
        let width = collectionView.frame.size.width
        let xInsets: CGFloat = 10
        let yInsets: CGFloat = 10
        
        return CGSize(width: (width / numberOfColumns ) - (xInsets+yInsets), height: (width / numberOfColumns ) - (xInsets+yInsets))
    }
}
