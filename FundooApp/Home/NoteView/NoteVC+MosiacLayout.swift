//
//  NoteVC+MosiacLayout.swift
//  FundooApp
//
//  Created by admin on 08/06/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

extension NoteViewController : MosaicLayoutDelegate {
    
    func collectionView(collectionView: UICollectionView, heightForCaptionAt indexPath: IndexPath, with width: CGFloat) -> CGFloat {
        
        let discription = models[indexPath.item].note!
        let titleHeight:CGFloat = 10
        let discriptionHeight = getContentHeight(for: discription, with: UIFont.systemFont(ofSize: 15), width: 190)
        return discriptionHeight + titleHeight
    }
    
    func getContentHeight(for text: String, with font: UIFont, width: CGFloat) -> CGFloat {
        let nsstring = NSString(string: text)
        let maxHeight = CGFloat(350.0)
        let textAttributes = [NSAttributedString.Key.font : font]
        let boundingRect = nsstring.boundingRect(with: CGSize(width: width, height: maxHeight), options: .usesLineFragmentOrigin, attributes: textAttributes, context: nil)
        return ceil(boundingRect.height)
    }
    
}
