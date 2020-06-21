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
    
    init(delegate: AddLabelViewDelegate) {
        self.addLabelView = delegate
    }
    
    func insertLabel(label: Label) {
        
    }
}
