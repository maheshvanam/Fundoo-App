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
    
    var colors = [UIColor.white,UIColor.yellow,UIColor.green,UIColor.black,UIColor.purple,UIColor.red,UIColor.orange,UIColor.lightGray]
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colors.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ColorCell", for: indexPath) as! ColorCell
        cell.tintColor = colors[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let color : [String:UIColor]
        color = [ "c" : colors[indexPath.item]]
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "load"), object: nil,userInfo: color)
    }

}
