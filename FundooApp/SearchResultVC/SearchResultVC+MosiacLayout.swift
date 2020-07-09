//
//  SearchResultVC+MosiacLayout.swift
//  FundooApp
//
//  Created by admin on 28/06/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

extension SearchResultVC: MosaicLayoutDelegate {
    
    func collectionView(collectionView: UICollectionView, heightForCaptionAt indexPath: IndexPath, with width: CGFloat) -> CGFloat {
       let discription = dataSource[indexPath.item].description
        let discriptionHeight = Constants.getContentHeight(for: discription, with: UIFont.systemFont(ofSize: fontSizeOfDiscription), width: widthOfDiscriptionField)
        return discriptionHeight + titleHeight
    }
    
}
