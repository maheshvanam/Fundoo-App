//
//  MosiacLayout.swift
//  FundooApp
//
//  Created by admin on 08/06/20.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation
import UIKit

class MosaicLayout: UICollectionViewLayout {

    var numberOfColumns: CGFloat = 1
    var cellPadding: CGFloat = 5
    let startingColumnIndex = 0
    let firstColumnIndex = 1
    private var contentHeight: CGFloat = 0
    private let defaultHeight: CGFloat = 60
    private let initialRepeating: CGFloat = 0
    private let paddingMutiplier: CGFloat = 2
    private var contentWidth: CGFloat {
        let insets = collectionView!.contentInset
        return (collectionView!.bounds.width - (insets.left + insets.right))
    }
    
    var delegate: MosaicLayoutDelegate?
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
            for column in startingColumnIndex ..< Int(numberOfColumns) {
                xOffsets.append(CGFloat(column) * columnWidth)
            }
            var column = startingColumnIndex
            var yOffsets = [CGFloat](repeating: initialRepeating, count: Int(numberOfColumns))
            
            for item in startingColumnIndex ..< collectionView!.numberOfItems(inSection: startingColumnIndex) {
                let indexPath = IndexPath(item: item, section: startingColumnIndex)
                let width = columnWidth - cellPadding * paddingMutiplier
                let captionHeight: CGFloat =  (delegate?.collectionView(collectionView: collectionView!, heightForCaptionAt: indexPath, with: width))!
                let height: CGFloat = defaultHeight + captionHeight + cellPadding
                let frame = CGRect(x: xOffsets[column], y: yOffsets[column], width: columnWidth, height: height)
                let insetFrame = frame.insetBy(dx: cellPadding, dy: cellPadding)
                let attributes = MosaicLayoutAttributes(forCellWith: indexPath)
                attributes.frame = insetFrame
                attributesCache.append(attributes)
                contentHeight = max(contentHeight, frame.maxY)
                yOffsets[column] = yOffsets[column] + height
                
                if column >= (Int(numberOfColumns) - firstColumnIndex) {
                    column = startingColumnIndex
                } else {
                    column += firstColumnIndex
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

