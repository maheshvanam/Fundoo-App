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
    var numberOfColumns: CGFloat = 1
    var cellPadding: CGFloat = 5.0
    
    private var contentHeight: CGFloat = 0.0
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
            for column in 0 ..< Int(numberOfColumns) {
                xOffsets.append(CGFloat(column) * columnWidth)
            }
            
            var column = 0
            var yOffsets = [CGFloat](repeating: 0, count: Int(numberOfColumns))
            
            for item in 0 ..< collectionView!.numberOfItems(inSection: 0) {
                let indexPath = IndexPath(item: item, section: 0)
                let width = columnWidth - cellPadding * 2
                let captionHeight: CGFloat = (delegate?.collectionView(collectionView: collectionView!, heightForCaptionAt: indexPath, with: width))!
                let height: CGFloat = 60 + captionHeight + cellPadding
                let frame = CGRect(x: xOffsets[column], y: yOffsets[column], width: columnWidth, height: height)
                let insetFrame = frame.insetBy(dx: cellPadding, dy: cellPadding)
                let attributes = MosaicLayoutAttributes(forCellWith: indexPath)
                attributes.frame = insetFrame
                attributesCache.append(attributes)
                contentHeight = max(contentHeight, frame.maxY)
                yOffsets[column] = yOffsets[column] + height
                
                if column >= (Int(numberOfColumns) - 1) {
                    column = 0
                } else {
                    column += 1
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

