//
//  SearchVC+UICollectionView.swift
//  FundooApp
//
//  Created by admin on 15/06/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

let cellReusableId = "SearchCell"
let colorCellReusableId = "SearchColorCell"
let resultViewControllerId = "SearchResultVC"
let colorCellRadius:CGFloat = 30
let titleHeight:CGFloat = 40
let fontSizeOfDiscription:CGFloat = 15
let widthOfDiscriptionField:CGFloat = 190
let maxContentHeight:CGFloat = 350
let colorCellWidth = 60
let colorCellHeight = 60
let cellPadding:CGFloat = 20
let collectionViewHeight:CGFloat = 80
let collectionViewHidingHeight:CGFloat = 0

extension SearchVC : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == reslutCollectionView {
            if currentDataSource.count == 0 {
                collectionViewHeader.isHidden = false
                colorCollectionView.isHidden = false
                colorCollectionViewHeightAnchor.constant = collectionViewHeight
            }else {
                collectionViewHeader.isHidden = true
                colorCollectionView.isHidden = true
                colorCollectionViewHeightAnchor.constant = collectionViewHidingHeight
            }
            return currentDataSource.count
        }
        return colorData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == reslutCollectionView {
            let cell = reslutCollectionView.dequeueReusableCell(withReuseIdentifier: cellReusableId ,for : indexPath) as! SearchCell
            cell.titleLabel.text = currentDataSource[indexPath.item].title
            let color = currentDataSource[indexPath.item].color
            cell.backgroundColor = Constants.colors[color]
            cell.discriptionLabel.text = currentDataSource[indexPath.item].description
            return cell
        }
        
        let cell = colorCollectionView.dequeueReusableCell(withReuseIdentifier: colorCellReusableId ,for : indexPath) as! SearchColorCell
        cell.layer.borderWidth = cellBorderWidth
        cell.layer.borderColor = UIColor.black.cgColor
        cell.layer.cornerRadius = colorCellRadius
        cell.colorView.backgroundColor = Constants.colors[ colorData[indexPath.item] ]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == reslutCollectionView {
            let discription = currentDataSource[indexPath.item].description!

            let discriptionHeight = Constants.getContentHeight(for: discription, with: UIFont.systemFont(ofSize: fontSizeOfDiscription), width: widthOfDiscriptionField)
            return CGSize(width: self.view.frame.width - cellPadding , height: discriptionHeight + titleHeight)
        }
        return CGSize(width: colorCellWidth , height: colorCellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == reslutCollectionView {
            let board = UIStoryboard(name: Constants.HOME_STORYBOARD, bundle: nil)
            guard let childVC = board.instantiateViewController(withIdentifier: Constants.EDIT_NOTE_VC) as? EditNoteViewController  else {
                   return
                 }
            childVC.note = currentDataSource[indexPath.item]
            navigationController?.pushViewController(childVC, animated: false)
        }
        else{
        let board = UIStoryboard(name: Constants.HOME_STORYBOARD, bundle: nil)
        guard let childVC = board.instantiateViewController(withIdentifier: resultViewControllerId ) as? SearchResultVC  else {
               return
             }
        childVC.dataSource = originalDataSource.filter {
            $0.color == colorData[indexPath.item]
        }
        navigationController?.pushViewController(childVC, animated: false)
        }
    }
}
