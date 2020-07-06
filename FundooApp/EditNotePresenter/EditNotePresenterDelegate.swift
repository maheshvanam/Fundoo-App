//
//  EditNotePresenterDelegate.swift
//  FundooApp
//
//  Created by admin on 10/06/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

protocol EditNotePresenterDelegate {
    func initializeView()
    func updateViews(color: UIColor)
    func fieldsAreEmpty()-> Bool
    func getNote()-> FundooNote?
    func isNewNote()-> Bool
    func getTitleText()-> String
    func getDiscriptionText()-> String
    func getCurrentColor()-> String?
    func postReloadCellsNotification()
}
