//
//  SearchVC.swift
//  FundooApp
//
//  Created by admin on 14/06/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class SearchVC:UIViewController {
    
    var searchController:UISearchController!
    var originalDataSource: [Note] = []
    var currentDataSource: [Note] = []
    var serachPresenter:SearchVCPresenter!
    var layoyt:MosaicLayout!
    
    @IBOutlet weak var searchContainerView: UIView!
    @IBOutlet weak var reslutCollectinView: UICollectionView!
    
    override func viewDidLoad() {
        serachPresenter = SearchVCPresenter()
        searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchContainerView.addSubview(searchController.searchBar)
        searchController.searchBar.delegate = self
        searchController.obscuresBackgroundDuringPresentation = true
        reslutCollectinView.dataSource = self
        reslutCollectinView.delegate = self
        layoyt = reslutCollectinView?.collectionViewLayout as? MosaicLayout
        layoyt.delegate = self
        originalDataSource = serachPresenter.getData()
    }
    
    func filterCurrentDataSource(searchTerm: String) {
        if searchTerm.count > 0 {
            currentDataSource = originalDataSource
            let filteredResults = currentDataSource.filter {
                ($0.title?.replacingOccurrences(of: " ", with: "").lowercased().contains(searchTerm.replacingOccurrences(of: " ", with: "").lowercased()))!
            }
            currentDataSource = filteredResults
            reslutCollectinView.reloadData()
        }
    }
}
