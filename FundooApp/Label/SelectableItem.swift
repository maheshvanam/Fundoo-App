//
//  SelectableItem.swift
//  FundooApp
//
//  Created by admin on 21/06/20.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation

class SelectableItem {
    public var item: LabelResponse
   var isSelected = false
   var title: String {
    return item.label
   }
   init(item: LabelResponse) {
    self.item = item
   }
}
