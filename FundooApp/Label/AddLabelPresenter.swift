//
//  AddLabelPresenter.swift
//  FundooApp
//
//  Created by admin on 21/06/20.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation

class AddLabelPresenter: AddLabelPresenterDelegate {
    
    var addLabelView: AddLabelViewDelegate
    
    let dbManager = RemoteLabelManager.shared
    init(delegate: AddLabelViewDelegate) {
        self.addLabelView = delegate
    }
    
//    func getLabels() -> [Label] {
//        let user = dbManager.getCurrentUser()
//        return user.labels!.allObjects as! [Label]
  //  }
    
    func createLabel(label:LabelResponse) {
        return dbManager.createLabel(label: label)
    }
    
//    func save() {
//        dbManager.saveData()
//    }
}
