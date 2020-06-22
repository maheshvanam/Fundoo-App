//
//  SideMenuOption.swift
//  FundooApp
//
//  Created by admin on 13/06/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

protocol SideMenuDelegate {
    var description:String { get  }
    var image:UIImage { get  }
}

enum FirstSectionOption:Int ,CustomStringConvertible,CaseIterable,SideMenuDelegate {
    case notes
    case reminder
    
    var description: String {
        switch self {
               case .notes: return "Notes"
               case .reminder: return "Reminder"
           }
    }
       
    var image: UIImage {
        switch self {
        case .notes:
            return UIImage(systemName: "doc.fill") ?? UIImage()
        case .reminder:
            return UIImage(systemName: "bell.fill") ?? UIImage()        }
    }
}

enum ThirdSectionOption:Int ,CustomStringConvertible,CaseIterable,SideMenuDelegate {
    case newLabel
    case archive
    case trash
    case signOut
    
    var description: String {
        switch self {
            case .newLabel: return "Labels"
            case .archive: return "Archive"
            case .trash: return "Trash"
            case .signOut: return "SignOut"
        }
    }
       
    var image: UIImage {
        switch self {
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

