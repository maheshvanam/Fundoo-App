//
//  CreateLabelPresenter.swift
//  FundooApp
//
//  Created by admin on 21/06/20.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation

class CreateLabelPresenter: CreateLabelPresenterDelegate {
    
    var createLabelView: CreateLabelViewDelegate!
    let dbManager = DatabaseManager()
    
    init(delegate: CreateLabelViewDelegate) {
        self.createLabelView = delegate
    }
    
    func getLabels() -> [Label] {
        let user = dbManager.getCurrentUser()
        return user.labels!.allObjects as! [Label]
    }
}
