//
//  MosaicLayoutDelegate.swift
//  FundooApp
//
//  Created by admin on 08/06/20.
//  Copyright © 2020 admin. All rights reserved.
//
import UIKit

protocol MosaicLayoutDelegate: class
{
    func collectionView(collectionView: UICollectionView, heightForCaptionAt indexPath:IndexPath, with width: CGFloat) -> CGFloat
}
