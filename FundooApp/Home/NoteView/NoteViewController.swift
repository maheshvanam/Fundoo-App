//
//  NoteViewController.swift
//  FundooApp
//
//  Created by admin on 02/06/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class NoteViewController: UIViewController {

    var notePresenter: NoteDelegate?
    @IBOutlet var collectionView: UICollectionView!
    var models = [NoteModel]()
    var cell: NoteCell!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let layout = collectionView?.collectionViewLayout as? MosaicLayout {
            layout.delegate = self
        }
        collectionView.clipsToBounds = false
        notePresenter = NotePresenter(delegate: self)
        title = "Notes"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.notePresenter!.updateTableData()
    }
}
extension NoteViewController : MosaicLayoutDelegate
{
    
    
    func collectionView(collectionView: UICollectionView, heightForCaptionAt indexPath: IndexPath, with width: CGFloat) -> CGFloat
    {
        
        let discription = models[indexPath.item].note!
        let titleHeight: CGFloat = 10
        let height = getHeight(for: discription, with: UIFont.systemFont(ofSize: 15), width: 190) + titleHeight
        return height
    }
    
    func getHeight(for text: String, with font: UIFont, width: CGFloat) -> CGFloat
    {
        let nsstring = NSString(string: text)
        let maxHeight = CGFloat(350.0)
        let textAttributes = [NSAttributedString.Key.font : font]
        let boundingRect = nsstring.boundingRect(with: CGSize(width: width, height: maxHeight), options: .usesLineFragmentOrigin, attributes: textAttributes, context: nil)
        return ceil(boundingRect.height)
    }
}
