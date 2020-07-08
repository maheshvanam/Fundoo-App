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
    @IBOutlet weak var collectionViewHeader: UILabel!
     @IBOutlet weak var reslutCollectionView: UICollectionView!
    @IBOutlet weak var colorCollectionViewHeightAnchor: NSLayoutConstraint!
    var searchController:UISearchController!
    var originalDataSource: [NoteResponse] = []
    var currentDataSource: [NoteResponse] = []
    var colorData: [String] = []
    var serachPresenter:SearchVCPresenter!

    
    override func viewDidLoad() {
        self.serachPresenter = SearchVCPresenter()
        self.cofigureSearchController()
        self.configureCollectionViews()
        //originalDataSource = self.serachPresenter.getData()
        self.getColorData()
    }
    
    func configureCollectionViews() {
        reslutCollectionView.dataSource = self
        reslutCollectionView.delegate = self
        reslutCollectionView.showsVerticalScrollIndicator = false
        colorCollectionView.delegate = self
        colorCollectionView.dataSource = self
    }
    
    func cofigureSearchController() {
        searchController = UISearchController(searchResultsController: nil)
         searchController.searchResultsUpdater = self
        self.navigationItem.titleView = searchController.searchBar
         self.definesPresentationContext = true
         searchController.hidesNavigationBarDuringPresentation = false
         searchController.searchBar.delegate = self
         searchController.obscuresBackgroundDuringPresentation = true
    }
    
    func filterCurrentDataSource(searchTerm: String) {
        if searchTerm.count > 0 {
            currentDataSource = originalDataSource
            let filteredResults = currentDataSource.filter {
                ($0.title?.replacingOccurrences(of: " ", with: "").lowercased().contains(searchTerm.replacingOccurrences(of: " ", with: "").lowercased()))! || ($0.description?.replacingOccurrences(of: " ", with: "").lowercased().contains(searchTerm.replacingOccurrences(of: " ", with: "").lowercased()))!
            }
            currentDataSource = filteredResults
            reslutCollectionView.reloadData()
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
    
