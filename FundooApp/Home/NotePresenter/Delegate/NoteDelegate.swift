//
//  NoteDelegate.swift
//  FundooApp
//
//  Created by admin on 04/06/20.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation

protocol NoteDelegate {
    func updateCells()
    func updateDataSource(fetchLimit: Int,fetchOffcet: Int)
    func reorderCell(model:[Note],sourceIndexPath: IndexPath,destinationIndexPath: IndexPath)
}
