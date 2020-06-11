//
//  SlideUpMenuOption.swift
//  FundooApp
//
//  Created by admin on 12/06/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

enum SlideUpMenuOption: Int, CustomStringConvertible {
    
    case Delete
    case MakeACopy
    case Send
    case Collaborator
    case Labels
    
    var description: String {
        switch self {
            case .Delete: return "Delete"
            case .MakeACopy: return "Make a copy"
            case .Send: return "Send"
            case .Collaborator: return "Collaborator"
            case .Labels: return "Labels"
        }
    }
    
    var image: UIImage {
        switch self {
            case .Delete:
                return UIImage(systemName: "trash.fill") ?? UIImage()
            case .MakeACopy:
                return UIImage(systemName: "square.fill.on.square.fill") ?? UIImage()
            case .Send:
                return UIImage(systemName: "arrowshape.turn.up.right.fill") ?? UIImage()
            case .Collaborator:
                return UIImage(systemName: "person.badge.plus.fill") ?? UIImage()
            case .Labels:
                return UIImage(systemName: "tag.fill") ?? UIImage()
        }
    }
}
