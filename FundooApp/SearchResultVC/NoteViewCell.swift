//
//  NoteViewCell.swift
//  FundooApp
//
//  Created by admin on 25/06/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

let labelViewCellId = "LabelViewCell"
class NoteViewCell: UICollectionViewCell, AddLabelViewDelegate {
    
    @IBOutlet weak var titleField: UILabel!
    @IBOutlet weak var descriptionField: UILabel!
    @IBOutlet weak var reminderView: UIView!
    @IBOutlet weak var reminderField: UILabel!
    @IBOutlet weak var labelCollectionView: UICollectionView!
    var layout:PinterestLayout!
    var addLabelPresenter:AddLabelPresenterDelegate!
    var dataSource:[Label] = []
    private let cornerRadius:CGFloat = 15
    private let borderWidth:CGFloat = 0.5
    private let dateFormat      = "MMM d, h:mm a"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        layout = labelCollectionView?.collectionViewLayout as? PinterestLayout
        let nib = UINib(nibName: labelViewCellId, bundle: nil)
        labelCollectionView.register(nib, forCellWithReuseIdentifier: labelViewCellId)
        addLabelPresenter = AddLabelPresenter(delegate: self)
        labelCollectionView.dataSource = self
        labelCollectionView.delegate = self
        self.reminderView.layer.cornerRadius = cornerRadius
        self.reminderView.layer.borderColor = UIColor.gray.cgColor
        self.reminderView.layer.borderWidth = borderWidth
    }
    
    func updateView(note:Note){
        self.titleField.text = note.title
        self.descriptionField.text = note.note
        self.reminderView.isHidden = true
        if note.reminder != nil {
            self.reminderView.isHidden = false
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = dateFormat
            let date = note.reminder
            self.reminderField.text = dateFormatter.string(from: date!)
        }
        self.dataSource = note.labels?.allObjects as! [Label]
    }
    
    func updateCellBackground(color:UIColor){
        self.backgroundColor = color
        self.layer.cornerRadius = cellRadius
        self.layer.borderWidth = cellBorderWidth
        self.layer.borderColor = UIColor.black.cgColor
    }
    
}

