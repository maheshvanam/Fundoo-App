//
//  ColorCollectionView.swift
//  FundooApp
//
//  Created by admin on 10/06/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ColorCell", for: indexPath) as! ColorCell
        cell.tintColor = Constants.myColors[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let color : [String:UIColor]
        color = [ "c" : Constants.myColors[indexPath.item]]
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: Constants.UPDATE_COLOR), object: nil,userInfo: color)
    }
}