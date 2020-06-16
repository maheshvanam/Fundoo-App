//
//  NoteVC+DropDelegate.swift
//  FundooApp
//
//  Created by admin on 13/06/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

extension NoteViewController: UICollectionViewDropDelegate {
    
    func collectionView(_ collectionView: UICollectionView, dropSessionDidUpdate session: UIDropSession, withDestinationIndexPath destinationIndexPath: IndexPath?) -> UICollectionViewDropProposal {
        if collectionView.hasActiveDrag {
            return UICollectionViewDropProposal(operation: .move, intent: .insertAtDestinationIndexPath)
        }
        return UICollectionViewDropProposal(operation: .forbidden)
    }
    
    func collectionView(_ collectionView: UICollectionView, performDropWith coordinator: UICollectionViewDropCoordinator) {
           var desinationIndexPath: IndexPath
        if let indexPath = coordinator.destinationIndexPath {
               desinationIndexPath = indexPath
           }
           else {
               let row = collectionView.numberOfItems(inSection: initialSection)
               desinationIndexPath = IndexPath(item: row - firstIndexPath , section: initialSection)
           }
           
           if coordinator.proposal.operation == .move {
               reorderItems(coordinator: coordinator, destinationIndexPath: desinationIndexPath, collectionView: collectionView)
           }
           
       }
       
    func reorderItems(coordinator: UICollectionViewDropCoordinator, destinationIndexPath: IndexPath, collectionView: UICollectionView) {
           if let item = coordinator.items.first, let sourceIndexPath = item.sourceIndexPath {
               collectionView.performBatchUpdates(
               {
                let source = models[sourceIndexPath.item]
                let destination = models[destinationIndexPath.item]
                self.models.remove(at: sourceIndexPath.item)
                self.models.insert(item.dragItem.localObject as! Note, at: destinationIndexPath.item)
                       collectionView.deleteItems(at: [sourceIndexPath])
                       collectionView.insertItems(at: [destinationIndexPath])
               notePresenter?.updateReorderData(sourceNote: source, destinationNote: destination)
           // notePresenter?.reorderCell(model: models, sourceIndexPath: sourceIndexPath, destinationIndexPath: destinationIndexPath)
                 self.reloadCells()
               }, completion: nil)
            }
    }
}
