//
//  SearchResultVC+CollectionView.swift
//  FundooApp
//
//  Created by admin on 28/06/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

extension SearchResultVC: UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = searchResultCollectionView.dequeueReusableCell(withReuseIdentifier: "NoteViewCell", for: indexPath) as! NoteViewCell
        let note = dataSource[indexPath.item]
        cell.updateView(note:note)
        let cellColor = Constants.colors[dataSource[indexPath.item].color!]
        cell.updateCellBackground(color:cellColor!)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let board = UIStoryboard(name: Constants.HOME_STORYBOARD, bundle: nil)
        guard let childVC = board.instantiateViewController(withIdentifier: Constants.EDIT_NOTE_VC) as? EditNoteViewController  else {
               return
             }
        childVC.note = dataSource[indexPath.item]
        navigationController?.pushViewController(childVC, animated: false)
    }
}
