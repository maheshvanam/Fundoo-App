//
//  CreateLabelPresenter.swift
//  FundooApp
//
//  Created by admin on 21/06/20.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation

class LabelPresenter: LabelPresenterDelegate {
    
    var labelView: LabelViewDelegate!
    let dbManager = DatabaseManager()
    
    init(delegate: LabelViewDelegate) {
        self.labelView = delegate
    }
    
    func getLabels() -> [Label] {
        let user = dbManager.getCurrentUser()
        return user.labels!.allObjects as! [Label]
    }
}
