//
//  NotePresenterDelegate.swift
//  FundooApp
//
//  Created by admin on 04/06/20.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation

protocol NoteViewDelegate {
    func setTableData(data: [NoteModel])
    func updateView()
    func addNotificationObservers()
}
