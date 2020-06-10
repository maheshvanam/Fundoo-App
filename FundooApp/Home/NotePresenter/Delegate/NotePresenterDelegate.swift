//
//  NotePresenterDelegate.swift
//  FundooApp
//
//  Created by admin on 04/06/20.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation

protocol NotePresenterDelegate {
    func setTableData(data: [Note])
    func updateView()
}
