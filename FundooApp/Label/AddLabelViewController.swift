//
//  LabelViewController.swift
//  FundooApp
//
//  Created by admin on 17/06/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

let reusableCellId = "CheckMarkCell"
let checkMarkNib = "CheckMarkCell"
let createLabelNib = "CreateLabelCell"
let createLabelReusableCellId = "CreateLabel"
let rowHeight:CGFloat = 50
var isNewLabel:Bool = false

class AddLabelViewController: UIViewController {
    
    @IBOutlet var labelTableView:UITableView!
    var originalDataSource:[String] = []
    var currentDataSource:[String] = []
    var searchController:UISearchController!
    var searchTerm:String = ""
    var items = [SelectableItem]()
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: checkMarkNib, bundle: nil)
        labelTableView.register(nib, forCellReuseIdentifier: reusableCellId)
        let createNib = UINib(nibName: createLabelNib, bundle: nil)
        labelTableView.register(createNib, forCellReuseIdentifier: createLabelReusableCellId)
        labelTableView.register(nib, forCellReuseIdentifier: reusableCellId)
        cofigureSearchController()
        labelTableView.delegate = self
        labelTableView.dataSource = self
        labelTableView.separatorStyle = .none
        originalDataSource.append("1")
        originalDataSource.append("2")
        originalDataSource.append("3")
        currentDataSource = originalDataSource
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
            currentDataSource   = originalDataSource
            let filteredResults = currentDataSource.filter {
                $0.replacingOccurrences(of: " ", with: "").lowercased().contains(searchTerm.replacingOccurrences(of: " ", with: "").lowercased())
            }
             self.searchTerm   = searchTerm
             currentDataSource = filteredResults
            isNewLabel        = ( currentDataSource.count == 0 ) && (searchTerm.trimmingCharacters(in: .whitespaces).count != 0) ? true : false
            labelTableView.reloadData()
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        let selectedItems = items.filter{ $0.isSelected }
        print( selectedItems.map({$0.title}))
    }
}
