//
//  SearchResultVC.swift
//  FundooApp
//
//  Created by admin on 15/06/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

let dequeueReusableCellId   = "SearchResultCell"
let noteViewCell            = "NoteViewCell"
let numberOfColumns:CGFloat = 2
let cellBorderWidth:CGFloat = 1
let cellRadius:CGFloat      = 6

class SearchResultVC: UIViewController {

    @IBOutlet weak var searchResultCollectionView: UICollectionView!
    var layout:MosaicLayout!
    var dataSource: [FundooNote]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layout = searchResultCollectionView?.collectionViewLayout as? MosaicLayout
        layout.delegate = self
        layout.numberOfColumns = numberOfColumns
        searchResultCollectionView.dataSource = self
        searchResultCollectionView.delegate = self
        
        let nib = UINib(nibName:noteViewCell, bundle: nil)
        searchResultCollectionView.register(nib, forCellWithReuseIdentifier: noteViewCell)
    }
}
