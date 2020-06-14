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
    
    @IBOutlet weak var searchContainerView: UIView!
    @IBOutlet weak var resutTable: UITableView!
    
    override func viewDidLoad() {
        serachPresenter = SearchVCPresenter()
        searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchContainerView.addSubview(searchController.searchBar)
        searchController.searchBar.delegate = self
        
        resutTable.dataSource = self
        resutTable.delegate = self
        
        originalDataSource = serachPresenter.getData()
    }
    
    func filterCurrentDataSource(searchTerm: String) {
        if searchTerm.count > 0 {
            currentDataSource = originalDataSource
            let filteredResults = currentDataSource.filter {
                ($0.title?.replacingOccurrences(of: " ", with: "").lowercased().contains(searchTerm.replacingOccurrences(of: " ", with: "").lowercased()))!
            }
            currentDataSource = filteredResults
            resutTable.reloadData()
        }
    }
    
}

extension SearchVC: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
    }
}

extension SearchVC: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        
    }
}

extension SearchVC : UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentDataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = resutTable.dequeueReusableCell(withIdentifier: "SearchCell" ,for : indexPath)
        cell.textLabel?.text = currentDataSource[indexPath.row].title
        return cell
    }
}
