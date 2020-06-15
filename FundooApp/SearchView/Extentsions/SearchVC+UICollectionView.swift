//
//  SearchVC+UICollectionView.swift
//  FundooApp
//
//  Created by admin on 15/06/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

let cellReusableId = "SearchCell"
let coloreCellRadius:CGFloat = 30
let titleHeight:CGFloat = 40
let fontSizeOfDiscription:CGFloat = 15
let widthOfDiscriptionField:CGFloat = 190
let maxContentHeight:CGFloat = 350

extension SearchVC : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == reslutCollectinView {
            return currentDataSource.count
        }
        return colorData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == reslutCollectinView {
            let cell = reslutCollectinView.dequeueReusableCell(withReuseIdentifier: cellReusableId ,for : indexPath) as! SearchCell
            cell.titleLabel.text = currentDataSource[indexPath.item].title
            cell.backgroundColor = Constants.colors[ currentDataSource[indexPath.item].color!]
            cell.discriptionLabel.text = currentDataSource[indexPath.item].note
            return cell
        }
        
        let cell = colorCollectionView.dequeueReusableCell(withReuseIdentifier: "SearchColorCell" ,for : indexPath) as! SearchColorCell
        cell.layer.borderWidth = 1
        cell.layer.borderColor = UIColor.black.cgColor
        cell.layer.cornerRadius = coloreCellRadius
        cell.colorView.backgroundColor = Constants.colors[ colorData[indexPath.item] ]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == reslutCollectinView {
            let discription = currentDataSource[indexPath.item].note!

            let discriptionHeight = Constants.getContentHeight(for: discription, with: UIFont.systemFont(ofSize: fontSizeOfDiscription), width: widthOfDiscriptionField)
            return CGSize(width: self.view.frame.width - 20, height: discriptionHeight + titleHeight)
        }
        return CGSize(width: 60, height: 60)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == reslutCollectinView {
            let board = UIStoryboard(name: Constants.HOME_STORYBOARD, bundle: nil)
            guard let childVC = board.instantiateViewController(withIdentifier: Constants.EDIT_NOTE_VC) as? EditNoteVC  else {
                   return
                 }
            childVC.note = currentDataSource[indexPath.item]
            navigationController?.pushViewController(childVC, animated: false)
        }
        else{
        let board = UIStoryboard(name: Constants.HOME_STORYBOARD, bundle: nil)
        guard let childVC = board.instantiateViewController(withIdentifier: "SearchResultVC") as? SearchResultVC  else {
               return
             }
        childVC.dataSource = currentDataSource.filter {
            $0.color == nil
        }
        navigationController?.pushViewController(childVC, animated: false)
        }
    }
}
