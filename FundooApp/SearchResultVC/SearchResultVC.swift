//
//  SearchResultVC.swift
//  FundooApp
//
//  Created by admin on 15/06/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

let dequeueReusableCellId = "SearchResultCell"
let numberOfColumns:CGFloat = 2
let cellBorderWidth:CGFloat = 1
let cellRadius:CGFloat = 6

class SearchResultVC: UIViewController {

    @IBOutlet weak var searchResultCollectionView: UICollectionView!
    var layout:MosaicLayout!
    var dataSource: [Note]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layout = searchResultCollectionView?.collectionViewLayout as? MosaicLayout
        layout.delegate = self
        layout.numberOfColumns = numberOfColumns
        searchResultCollectionView.dataSource = self
        searchResultCollectionView.delegate = self
        
        let nib = UINib(nibName: "NoteViewCell", bundle: nil)
        searchResultCollectionView.register(nib, forCellWithReuseIdentifier: "NoteViewCell")
        
    }

}

extension SearchResultVC: UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = searchResultCollectionView.dequeueReusableCell(withReuseIdentifier: "NoteViewCell", for: indexPath) as! NoteViewCell
        let note = dataSource[indexPath.item]
        cell.titleField.text = note.title
        cell.descriptionField.text = note.note
        //cell.titleLabel.text = note.title
       // cell.discriptionLabel.text = note.note
        cell.reminderView.isHidden = true
        if note.reminder != nil {
            cell.reminderView.isHidden = false
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MMM d, h:mm a"
            let date = note.reminder
            cell.reminderField.text = dateFormatter.string(from: date!)
          //  cell.reminderLabel.text = dateFormatter.string(from: date!)
        }
        let cellColor = Constants.colors[dataSource[indexPath.item].color!]
        cell.backgroundColor = cellColor
        cell.layer.cornerRadius = cellRadius
        cell.layer.borderWidth = cellBorderWidth
        cell.layer.borderColor = UIColor.black.cgColor
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let board = UIStoryboard(name: Constants.HOME_STORYBOARD, bundle: nil)
        guard let childVC = board.instantiateViewController(withIdentifier: Constants.EDIT_NOTE_VC) as? EditNoteViewController  else {
               return
             }
        childVC.note = dataSource[indexPath.item]
        navigationController?.pushViewController(childVC, animated: false)
    }
}
extension SearchResultVC: MosaicLayoutDelegate {
    
    func collectionView(collectionView: UICollectionView, heightForCaptionAt indexPath: IndexPath, with width: CGFloat) -> CGFloat {
       let discription = dataSource[indexPath.item].note!
        let discriptionHeight = Constants.getContentHeight(for: discription, with: UIFont.systemFont(ofSize: fontSizeOfDiscription), width: widthOfDiscriptionField)
        return discriptionHeight + titleHeight
    }
    
}
