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
    let dbManager = RemoteLabelManager.shared
    
    init(delegate: LabelViewDelegate) {
        self.labelView = delegate
    }
    
    func getLabels() {
        DispatchQueue.main.async {
            self.dbManager.getLabels(urlPath: RestUrl.GET_LABEL_LIST_URL_PATH) { [weak self] (labels) in
                self?.labelView.updateLabelsDataSource(label: labels)
            }
        }
    }

    func deleteLabel(label:LabelResponse) {
        dbManager.deleteLabel(label: label)
    }
}
