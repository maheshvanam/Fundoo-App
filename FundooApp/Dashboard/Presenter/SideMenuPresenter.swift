//
//  SideMenuPresenter.swift
//  FundooApp
//
//  Created by admin on 25/06/20.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation

class SideMenuPresenter:SideMenuPresenterDelegate {
    
    let dbManager = RemoteLabelManager.shared
    func getLabels(callback:@escaping([LabelResponse])->Void) {
        dbManager.getLabels(urlPath: RestUrl.GET_LABEL_LIST_URL_PATH) { (labels) in
            DispatchQueue.main.async {
                callback(labels)
            }
        }
    }
}
