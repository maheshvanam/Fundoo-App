//
//  SelectableItem.swift
//  FundooApp
//
//  Created by admin on 21/06/20.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation

class SelectableItem {
   private var item: String
   var isSelected = false
   var title: String {
      return item
   }
   init(item: String) {
      self.item = item
   }
}
