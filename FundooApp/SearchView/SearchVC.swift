//
//  SearchVC.swift
//  FundooApp
//
//  Created by admin on 14/06/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class SearchVC:UIViewController {
    
    @IBOutlet weak var colorCollectionView: UICollectionView!
    var searchController:UISearchController!
    var originalDataSource: [Note] = []
    var currentDataSource: [Note] = []
    var colorData: [String] = []
    var serachPresenter:SearchVCPresenter!
    @IBOutlet weak var reslutCollectinView: UICollectionView!
    
    override func viewDidLoad() {
        serachPresenter = SearchVCPresenter()
        searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
       self.navigationItem.titleView = searchController.searchBar
        self.definesPresentationContext = true
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.searchBar.delegate = self
        searchController.obscuresBackgroundDuringPresentation = true
        reslutCollectinView.dataSource = self
        reslutCollectinView.delegate = self
        reslutCollectinView.showsVerticalScrollIndicator = false
        colorCollectionView.delegate = self
        colorCollectionView.dataSource = self
        originalDataSource = serachPresenter.getData()
        getColorData()
    }
    
    func filterCurrentDataSource(searchTerm: String) {
        if searchTerm.count > 0 {
            currentDataSource = originalDataSource
            let filteredResults = currentDataSource.filter {
                ($0.title?.replacingOccurrences(of: " ", with: "").lowercased().contains(searchTerm.replacingOccurrences(of: " ", with: "").lowercased()))! || ($0.note?.replacingOccurrences(of: " ", with: "").lowercased().contains(searchTerm.replacingOccurrences(of: " ", with: "").lowercased()))!
            }
            currentDataSource = filteredResults
            reslutCollectinView.reloadData()
        }
    }
    
    func getColorData() {
        var myArray: [String] = []
        for note in originalDataSource {
           myArray.append(note.color!)
        }
        colorData = Array(Set(myArray))
    }
}
