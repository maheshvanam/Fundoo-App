//
//  AddLabelPresenterDelegate.swift
//  FundooApp
//
//  Created by admin on 21/06/20.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation

protocol AddLabelPresenterDelegate {
    func insertLabel(label:Label)
    func getLabels()-> [Label]
    func createLabel() -> Label
     func save()
}