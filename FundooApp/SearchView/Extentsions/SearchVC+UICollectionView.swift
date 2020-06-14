//
//  SearchVC+UICollectionView.swift
//  FundooApp
//
//  Created by admin on 15/06/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

let cellReusableId = "SearchCell"

extension SearchVC : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return currentDataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = reslutCollectinView.dequeueReusableCell(withReuseIdentifier: cellReusableId ,for : indexPath) as! SearchCell
        cell.titleLabel.text = currentDataSource[indexPath.row].title
        cell.discriptionLabel.text = currentDataSource[indexPath.row].note
        return cell
    }
}
