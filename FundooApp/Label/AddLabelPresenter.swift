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
    
    func getLabels(callback:@escaping([LabelResponse])->Void) {
        dbManager.getLabels(urlPath: RestUrl.GET_LABEL_LIST_URL_PATH) { (labels) in
                callback(labels)
        }
    }
    
    func createLabel(label:LabelResponse) {
        return dbManager.createLabel(label: label)
    }
    
    func updateLabel(label:LabelResponse) {
        dbManager.updateLabel(label: label)
    }
    
//    func save() {
//        dbManager.saveData()
//    }
}
