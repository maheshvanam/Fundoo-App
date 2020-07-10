//
//  NoteViewCell+LabelCollectionView.swift
//  FundooApp
//
//  Created by admin on 28/06/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

private let lineSpacing:CGFloat = 5
private let cellSpacing:CGFloat = 2
private let cellHeight:CGFloat  = 20
private let fontSize:CGFloat    = 8
private let fontName:String     = "Kailasa"
private let padding:CGFloat     = 10

extension NoteViewCell :UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = labelCollectionView.dequeueReusableCell(withReuseIdentifier: labelViewCellId, for: indexPath) as! LabelViewCell
        cell.labelField.text = dataSource[indexPath.item].label
        cell.removeButton.tag = indexPath.item
              cell.removeButton.addTarget(self, action: #selector(removeLabel(sender:)), for: .touchUpInside)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let tag = dataSource[indexPath.row]
        let font = UIFont(name: fontName, size: fontSize)!
        let size = tag.label.size(withAttributes: [NSAttributedString.Key.font: font])
        let dynamicCellWidth = size.width + 30
        return CGSize(width: dynamicCellWidth + padding , height: cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return lineSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return cellSpacing
    }
    
    @objc func removeLabel(sender:UIButton) {
        let index = sender.tag
        let label = dataSource[index]
        self.noteCellPresenter.removeLabelFromNote(label:label,note:self.note)
        self.labelCollectionView.reloadData()
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: Constants.RELOAD_CELLS), object: nil)
    }
}

