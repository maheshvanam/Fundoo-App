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
        cell = (collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! NoteCell)
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.titleLabel?.text = models[indexPath.item].title
        cell.noteLabel?.text = models[indexPath.item].note
        return cell
    }
}
/*
extension NoteViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let discription = models[indexPath.item].note!
        
        let height = getHeight(for: discription, with: UIFont.systemFont(ofSize: 15), width: 190) + 60
        return CGSize(width: 190, height: height )
    }
    
    func getHeight(for text: String, with font: UIFont, width: CGFloat)-> CGFloat {
        let nsstring = NSString(string: text)
        let maxHeight = CGFloat(350.0)
        let textAttribute = [NSAttributedString.Key.font: font]
        let boundingRect = nsstring.boundingRect(with: CGSize(width: width, height: maxHeight), options: .usesLineFragmentOrigin, attributes: textAttribute, context: nil)
        return ceil(boundingRect.height)
    }
}*/

