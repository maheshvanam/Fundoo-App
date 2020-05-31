//
//  MenuOption.swift
//  FundooApp
//
//  Created by admin on 01/06/20.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation
import UIKit

enum MenuOption: Int,CustomStringConvertible {
    
    case Notes
    case Reminders
    case CreateNewLabel
    case Archive
    case Trash
    case LogOut
    
    var description: String {
        switch self {
        case .Notes: return "Notes"
        case .Reminders: return "Reminder"
        case .CreateNewLabel: return "Create new label"
        case .Archive: return "Archive"
        case .Trash: return "Trash"
        case .LogOut: return "Log Out"
    }
    
    var image: UIImage {
        switch self {
        case .Notes: return UIImage(named: "notes") ?? UIImage()
        case .Reminders: return UIImage(named: "reminder") ?? UIImage()
        case .CreateNewLabel: return UIImage(named: "new_label") ?? UIImage()
        case .Archive: return UIImage(named: "archive") ?? UIImage()
        case .Trash: return UIImage(named: "trash") ?? UIImage()
        case .LogOut: return UIImage(named: "logout") ?? UIImage()
    }
}
