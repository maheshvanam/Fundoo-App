//
//  NoteViewCell.swift
//  FundooApp
//
//  Created by admin on 25/06/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit
private let labelViewCellId = "LabelViewCell"
class NoteViewCell: UICollectionViewCell, AddLabelViewDelegate {
    
    @IBOutlet weak var titleField: UILabel!
    @IBOutlet weak var descriptionField: UILabel!
    @IBOutlet weak var reminderView: UIView!
    @IBOutlet weak var reminderField: UILabel!
    @IBOutlet weak var labelCollectionView: UICollectionView!
    var layout:PinterestLayout!
    private let cornerRadius:CGFloat = 15
    private let borderWidth:CGFloat = 0.5
    var addLabelPresenter:AddLabelPresenterDelegate!
    var dataSource:[Label] = []
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        layout = labelCollectionView?.collectionViewLayout as? PinterestLayout
        let nib = UINib(nibName: labelViewCellId, bundle: nil)
        labelCollectionView.register(nib, forCellWithReuseIdentifier: labelViewCellId)
        addLabelPresenter = AddLabelPresenter(delegate: self)
        labelCollectionView.dataSource = self
        labelCollectionView.delegate = self
        dataSource = addLabelPresenter.getLabels()
        self.reminderView.layer.cornerRadius = cornerRadius
        self.reminderView.layer.borderColor = UIColor.gray.cgColor
        self.reminderView.layer.borderWidth = borderWidth
    }
    
}

extension NoteViewCell :UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = labelCollectionView.dequeueReusableCell(withReuseIdentifier: labelViewCellId, for: indexPath) as! LabelViewCell
        cell.labelField.text = dataSource[indexPath.item].title
        return cell
    }
}

extension NoteViewCell: PinterestLayoutDelegate {
    func collectionView(_ collectionView: UICollectionView, heightForPhotoAtIndexPath indexPath: IndexPath) -> CGFloat {
                let title = dataSource[indexPath.item].title
                let titleHeight = Constants.getContentHeight(for: title!, with: UIFont.systemFont(ofSize: 8), width: widthOfDiscriptionField)
                return titleHeight
    }
    
//    func collectionView(collectionView: UICollectionView, heightForCaptionAt indexPath: IndexPath, with width: CGFloat) -> CGFloat {
//        let title = dataSource[indexPath.item].title
//        let titleHeight = Constants.getContentHeight(for: title!, with: UIFont.systemFont(ofSize: 8), width: widthOfDiscriptionField)
//        return titleHeight
//    }
}
