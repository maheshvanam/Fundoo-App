//
//  NoteVC+DragDelegate.swift
//  FundooApp
//
//  Created by admin on 13/06/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

extension NoteViewController: UICollectionViewDragDelegate {
    
    func collectionView(_ collectionView: UICollectionView, itemsForBeginning session: UIDragSession, at indexPath: IndexPath) -> [UIDragItem] {
        let item = models[indexPath.item]
        let itemProvider = NSItemProvider(object: item as NSItemProviderWriting )
        let dragItem = UIDragItem(itemProvider: itemProvider)
        dragItem.localObject = item
        return [dragItem]
    }
}
