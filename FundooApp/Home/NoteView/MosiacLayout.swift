//
//  MosiacLayout.swift
//  FundooApp
//
//  Created by admin on 08/06/20.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation
import UIKit

class MosaicLayout: UICollectionViewLayout
{
    var delegate: MosaicLayoutDelegate?
    var numberOfColumns: CGFloat = Constants.FLOAT_1
    var cellPadding: CGFloat = Constants.FLOAT_5
    
    private var contentHeight: CGFloat = Constants.FLOAT_ZERO
    private var contentWidth: CGFloat {
        let insets = collectionView!.contentInset
        return (collectionView!.bounds.width - (insets.left + insets.right))
    }
    
    private var attributesCache = [MosaicLayoutAttributes]()
    
    func reloadData(){
        attributesCache = [MosaicLayoutAttributes]()
    }
    
    func setColumns(columns: CGFloat){
        numberOfColumns = columns
    }
    
    override func prepare()
    {
        if attributesCache.isEmpty {
            
            let columnWidth = contentWidth / numberOfColumns
            var xOffsets = [CGFloat]()
            for column in Constants.INT_0 ..< Int(numberOfColumns) {
                xOffsets.append(CGFloat(column) * columnWidth)
            }
            var column = Constants.INT_0
            var yOffsets = [CGFloat](repeating: Constants.FLOAT_ZERO, count: Int(numberOfColumns))
            
            for item in Constants.INT_0 ..< collectionView!.numberOfItems(inSection: Constants.INT_0) {
                let indexPath = IndexPath(item: item, section: Constants.INT_0)
                let width = columnWidth - cellPadding * Constants.FLOAT_2
                let captionHeight: CGFloat =  (delegate?.collectionView(collectionView: collectionView!, heightForCaptionAt: indexPath, with: width))!
                let height: CGFloat = Constants.FLOAT_60 + captionHeight + cellPadding
                let frame = CGRect(x: xOffsets[column], y: yOffsets[column], width: columnWidth, height: height)
                let insetFrame = frame.insetBy(dx: cellPadding, dy: cellPadding)
                let attributes = MosaicLayoutAttributes(forCellWith: indexPath)
                attributes.frame = insetFrame
                attributesCache.append(attributes)
                contentHeight = max(contentHeight, frame.maxY)
                yOffsets[column] = yOffsets[column] + height
                
                if column >= (Int(numberOfColumns) - Constants.INT_1) {
                    column = Constants.INT_0
                } else {
                    column += Constants.INT_1
                }
            }
        }
    }

    override var collectionViewContentSize: CGSize {
        return CGSize(width: contentWidth, height: contentHeight)
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]?
    {
        var layoutAttributes = [UICollectionViewLayoutAttributes]()
        
        for attributes in attributesCache {
            if attributes.frame.intersects(rect) {
                layoutAttributes.append(attributes)
            }
        }
        return layoutAttributes
    }
}

