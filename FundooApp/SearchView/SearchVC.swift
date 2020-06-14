//
//  SearchVC.swift
//  FundooApp
//
//  Created by admin on 14/06/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

let titleHeight:CGFloat = 10
let fontSizeOfDiscription:CGFloat = 15
let widthOfDiscriptionField:CGFloat = 190
let maxContentHeight:CGFloat = 350
let cellReusableId = "SearchCell"

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

extension SearchVC: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        if let searchText = searchController.searchBar.text {
            filterCurrentDataSource(searchTerm: searchText)
        }
    }
}

extension SearchVC: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchController.isActive = false
        if let searchText = searchBar.text {
            filterCurrentDataSource(searchTerm: searchText)
        }
    }
}

extension SearchVC : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return currentDataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = reslutCollectinView.dequeueReusableCell(withReuseIdentifier: cellReusableId ,for : indexPath) as! SearchCell
        cell.titleLabel.text = currentDataSource[indexPath.row].title
        cell.discriptionLabel.text = currentDataSource[indexPath.row].note
        return cell
    }
}

extension SearchVC : MosaicLayoutDelegate {
    
    func collectionView(collectionView: UICollectionView, heightForCaptionAt indexPath: IndexPath, with width: CGFloat) -> CGFloat {
        
        let discription = currentDataSource[indexPath.item].note!
        
        let discriptionHeight = getContentHeight(for: discription, with: UIFont.systemFont(ofSize: fontSizeOfDiscription), width: widthOfDiscriptionField)
        return discriptionHeight + titleHeight
    }
    
    func getContentHeight(for text: String, with font: UIFont, width: CGFloat) -> CGFloat {
        let nsstring = NSString(string: text)
        let textAttributes = [NSAttributedString.Key.font : font]
        let boundingRect = nsstring.boundingRect(with: CGSize(width: width, height: maxContentHeight), options: .usesLineFragmentOrigin, attributes: textAttributes, context: nil)
        return ceil(boundingRect.height)
    }
}
