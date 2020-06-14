//
//  SearchVC+MosaicLayoutDelegate.swift
//  FundooApp
//
//  Created by admin on 15/06/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

let titleHeight:CGFloat = 10
let fontSizeOfDiscription:CGFloat = 15
let widthOfDiscriptionField:CGFloat = 190
let maxContentHeight:CGFloat = 350

extension SearchVC : MosaicLayoutDelegate {
    
    func collectionView(collectionView: UICollectionView, heightForCaptionAt indexPath: IndexPath, with width: CGFloat) -> CGFloat {
        
        let discription = currentDataSource[indexPath.item].note!
        
        let discriptionHeight = getContentHeight(for: discription, with: UIFont.systemFont(ofSize: fontSizeOfDiscription), width: widthOfDiscriptionField)
        return discriptionHeight + titleHeight
    }
    
    func getContentHeight(for text: String, with font: UIFont, width: CGFloat) -> CGFloat {
        let nsstring = NSString(string: text)
        let textAttributes = [NSAttributedString.Key.font : font]
        let boundingRect = nsstring.boundingRect(with: CGSize(width: width, height: maxContentHeight), options: .usesLineFragmentOrigin, attributes: textAttributes, context: nil)
        return ceil(boundingRect.height)
    }
}
