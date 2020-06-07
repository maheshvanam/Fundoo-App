//
//  MosaicLayoutAttributes.swift
//  FundooApp
//
//  Created by admin on 08/06/20.
//  Copyright © 2020 admin. All rights reserved.
//
import UIKit

class MosaicLayoutAttributes: UICollectionViewLayoutAttributes
{
    var contentHeight: CGFloat = 0.0
    
    override func copy(with zone: NSZone? = nil) -> Any {
        let copy = super.copy(with: zone) as! MosaicLayoutAttributes
        copy.contentHeight = contentHeight
        return copy
    }
}
