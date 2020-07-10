//
//  AddLabelPresenterDelegate.swift
//  FundooApp
//
//  Created by admin on 21/06/20.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation

protocol AddLabelPresenterDelegate {
    func getLabels(callback:@escaping([LabelResponse])->Void)
    func createLabel(label:LabelResponse)
    func updateLabel(label:LabelResponse)
//    func save()
}
