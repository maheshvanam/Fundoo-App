//
//  SideMenuOption.swift
//  FundooApp
//
//  Created by admin on 13/06/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

enum SideMenuOption:Int ,CustomStringConvertible {
    case notes
    case reminder
    case newLabel
    case archive
    case trash
    case signOut
    
    
    var description: String {
        switch self {
               case .notes: return "Notes"
               case .reminder: return "Reminder"
               case .newLabel: return "Labels"
               case .archive: return "Archive"
               case .trash: return "Trash"
               case .signOut: return "SignOut"
           }
    }
       
    var image: UIImage {
        switch self {
        case .notes:
            return UIImage(systemName: "doc.fill") ?? UIImage()
        case .reminder:
            return UIImage(systemName: "bell.fill") ?? UIImage()
        case .newLabel:
            return UIImage(systemName: "tag.fill") ?? UIImage()
        case .archive:
            return UIImage(systemName: "archivebox.fill") ?? UIImage()
        case .trash:
            return UIImage(systemName: "trash.fill") ?? UIImage()
        case .signOut:
            return UIImage(systemName: "arrow.turn.down.left") ?? UIImage()
        }
    }
}
