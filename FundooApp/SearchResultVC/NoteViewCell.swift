//
//  NoteViewCell.swift
//  FundooApp
//
//  Created by admin on 25/06/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class NoteViewCell: UICollectionViewCell, AddLabelViewDelegate {
    
    @IBOutlet weak var titleField: UILabel!
    @IBOutlet weak var descriptionField: UILabel!
    @IBOutlet weak var reminderView: UIView!
    @IBOutlet weak var reminderField: UILabel!
    @IBOutlet weak var labelCollectionView: UICollectionView!
    
    var addLabelPresenter:AddLabelPresenterDelegate!
    var dataSource:[Label] = []
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        let nib = UINib(nibName: "LabelViewCell", bundle: nil)
        labelCollectionView.register(nib, forCellWithReuseIdentifier: "LabelViewCell")
        addLabelPresenter = AddLabelPresenter(delegate: self)
        labelCollectionView.dataSource = self
        labelCollectionView.delegate = self
        dataSource = addLabelPresenter.getLabels()
        self.reminderView.layer.cornerRadius = 15
        self.reminderView.layer.borderColor = UIColor.gray.cgColor
        self.reminderView.layer.borderWidth = 0.5
    }
    
}

extension NoteViewCell :UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = labelCollectionView.dequeueReusableCell(withReuseIdentifier: "LabelViewCell", for: indexPath) as! LabelViewCell
        cell.labelField.text = dataSource[indexPath.item].title
        return cell
    }
}
