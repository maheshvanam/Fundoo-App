//
//  SearchVCPresenterImpl.swift
//  FundooApp
//
//  Created by admin on 14/06/20.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation

class SearchVCPresenterImpl: SearchVCPresenterDelegate {
    
    func getData() -> [Note] {
        let dbManager = DatabaseManager()
        let user = dbManager.getCurrentUser()
        return  user.notes!.allObjects as! [Note]
    }
}
