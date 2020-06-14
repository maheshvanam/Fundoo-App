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
    
    @IBOutlet weak var searchContainerView: UIView!
    @IBOutlet weak var resutTable: UITableView!
    
    override func viewDidLoad() {
        searchController = UISearchController(searchResultsController: nil)
    }
}
