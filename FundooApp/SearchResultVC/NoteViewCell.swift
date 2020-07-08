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
    
    func updateView(note:NoteResponse){
        self.titleField.text = note.title
        self.descriptionField.text = note.description
        self.reminderView.isHidden = true
        if note.reminder != nil {
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = dateFormat
            if let date = note.reminder,!date.isEmpty {
            self.reminderView.isHidden = false
            self.reminderField.text = dateFormatter.string(from: date[0].toDate())
            }
        }
       // self.dataSource = note.labels?.allObjects as! [Label]
    }
    
    func updateCellBackground(color:UIColor){
        self.backgroundColor = color
        
    }
    
    func setShadow() {
        self.layer.shadowColor   = UIColor.gray .cgColor
        self.layer.shadowOffset  = CGSize(width: 0.0, height: 1.0)
        self.layer.shadowRadius  = 8
        self.layer.shadowOpacity = 0.5
        self.clipsToBounds       = true
        self.layer.masksToBounds = false
        self.layer.cornerRadius = cellRadius
        self.layer.borderWidth = cellBorderWidth
        self.layer.borderColor = UIColor.black.cgColor
    }
    
}

extension String {
    
    func toDate() -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let date = dateFormatter.date(from:self)!
        return date
    }
}
