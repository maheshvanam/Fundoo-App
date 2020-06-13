//
//  ColorCollectionView.swift
//  FundooApp
//
//  Created by admin on 10/06/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

private let reusableCollectionCellId = "ColorCell"

class ColorCollectionView: UICollectionView,UICollectionViewDataSource,UICollectionViewDelegate {

    override func awakeFromNib() {
        self.delegate = self
        self.dataSource = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Constants.myColors.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reusableCollectionCellId, for: indexPath) as! ColorCell
        cell.tintColor = Constants.myColors[indexPath.item]
        collectionView.showsHorizontalScrollIndicator = false
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let color : [String:UIColor]
        color = [ Constants.COLOR_KEY : Constants.myColors[indexPath.item]]
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: Constants.UPDATE_COLOR), object: nil,userInfo: color)
    }
}
