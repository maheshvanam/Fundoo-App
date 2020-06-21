//
//  SelectableItem.swift
//  FundooApp
//
//  Created by admin on 21/06/20.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation

class SelectableItem {
   public var item: Label
   var isSelected = false
   var title: String {
    return item.title!
   }
   init(item: Label) {
    self.item = item
   }
}
