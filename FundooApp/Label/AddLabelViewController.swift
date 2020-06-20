//
//  LabelViewController.swift
//  FundooApp
//
//  Created by admin on 17/06/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

let ReusableCellId = "CheckMarkCell"
let checkMarkNib = "CheckMarkCell"
let rowHeight:CGFloat = 50

class AddLabelViewController: UIViewController {
    
    @IBOutlet var labelTableView:UITableView!
    var dataSource:[String] = []
    var searchController:UISearchController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: checkMarkNib, bundle: nil)
        labelTableView.register(nib, forCellReuseIdentifier: ReusableCellId)
        cofigureSearchController()
        labelTableView.delegate = self
        labelTableView.dataSource = self
        dataSource.append("1")
        dataSource.append("2")
        dataSource.append("3")
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
    
}
extension AddLabelViewController :UISearchResultsUpdating,UISearchBarDelegate {
    
    func updateSearchResults(for searchController: UISearchController) {
        
    }
    
    
}
