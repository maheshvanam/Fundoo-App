//
//  Constants.swift
//  FundooApp
//
//  Created by admin on 04/06/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

enum Constants {
    
    static let TOGGLE_MENU = "TOGGLE_MENU"
    static let SET_BACK_BUTTON = "SET_BACK_BUTTON"
    static let UPDATE_NAV = "UPDATE_NAV"
    static let SET_MENU = "SET_MENU"
    static let EMAIL_KEY = "EMAIL"
    static let NAVIGATE_TO_LABELS = "create labels"
    static let NAVIGATE_TO_ARCHIVE = "Nav to Archive"
    static let NAVIGATE_TO_TRASH = "Nav to Trash"
    static let DELETE_NOTE_KEY = "delete note"
    static let CLOSE_SLIDE_UP_MENU = "close slideUp"
    static let ADD_LABEL_KEY = "labelKey"
    static let IS_LOGGED_IN_KEY = "IS_LOGGED_IN"
    static let NAVIGATE_TO_NOTE = "HOME"
    static let NAVIGATE_TO_REMINDER = "REMINDER"
    static let TOGGLE_GRID = "TOGGLE_GRID"
    static let ADD_NOTE = "Add Note"
    static let RELOAD_CELLS = "Reload cells"
    static let UPDATE_COLOR = "update color"
    static let OPTIONS_CELL_ID = "OptionsCell"
    static let labelsHeaderTitle     = "     LABELS"
    static let CollectionView_TabelCell_ID = "CollectionViewTabelCell"
    static let COLOR_KEY = "color"
    static let NOTES_TITLE = "Notes"
    static let HOME_STORYBOARD = "Home"
    static let FEATURES_STORYBOARD = "Features"
    static let REMINDER_STORYBOARD = "Reminder"
    static let MAIN_STORYBOARD = "Main"
    static let EDIT_NOTE_VC = "EditNoteVC"
    static let NOTE_VC  = "NoteViewController"
    static let UPDATE_LABEL_VC = "UpdateLabelViewController"
    static let ADD_LABEL_VC = "AddLabelVC"
    static let LABELS_VC = "labels"
    static let LABELS = "labels_View"
    
    static let REMINDER_VC = "ReminderViewController"
    static let USER_NOT_FOUND = "user not found"
    static let FETCH_ERROR = "fetching error"
    static let DATA_ERROR = "data not found error"
    static let signUpTitle = "Sign Up"
    static let signInTitle = "Sign In"
    static let gridImage = "rectangle.grid.2x2.fill"
    static let singleColumnImage = "rectangle.grid.1x2.fill"
    
    static let colors = ["#FFFFFF":#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1),"#83B1FC": #colorLiteral(red: 0.5137254902, green: 0.6941176471, blue: 0.9882352941, alpha: 1),"#F3BACF":#colorLiteral(red: 0.9529411765, green: 0.7294117647, blue: 0.8117647059, alpha: 1),"#D8CDCA":#colorLiteral(red: 0.8470588235, green: 0.8039215686, blue: 0.7921568627, alpha: 1),"#B389FD":#colorLiteral(red: 0.7019607843, green: 0.537254902, blue: 0.9921568627, alpha: 1),"#A5FAEB":#colorLiteral(red: 0.6470588235, green: 0.9803921569, blue: 0.9215686275, alpha: 1),"#81D8FC":#colorLiteral(red: 0.5058823529, green: 0.8470588235, blue: 0.9882352941, alpha: 1),"#EE877F":#colorLiteral(red: 0.9333333333, green: 0.5294117647, blue: 0.4980392157, alpha: 1),"#E6C9A8":#colorLiteral(red: 0.9019607843, green: 0.7882352941, blue: 0.6588235294, alpha: 1),"#FFF476":#colorLiteral(red: 1, green: 0.9568627451, blue: 0.462745098, alpha: 1),"#C8F68A":#colorLiteral(red: 0.7843137255, green: 0.9647058824, blue: 0.5411764706, alpha: 1),"#F0B531":#colorLiteral(red: 0.9411764706, green: 0.7098039216, blue: 0.1921568627, alpha: 1),"#000000":#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        ]
    
    static let myColors = [
                            #colorLiteral(red: 0.5135223269, green: 0.6951187253, blue: 0.9883810878, alpha: 1),#colorLiteral(red: 0.9528250098, green: 0.7310573459, blue: 0.8114919066, alpha: 1),#colorLiteral(red: 0.8455398679, green: 0.8021178842, blue: 0.7904801965, alpha: 1),#colorLiteral(red: 0.7030208111, green: 0.5371930599, blue: 0.993486464, alpha: 1),#colorLiteral(red: 0.6462398171, green: 0.9788334966, blue: 0.9230322838, alpha: 1),#colorLiteral(red: 0.504642725, green: 0.846619904, blue: 0.9870195985, alpha: 1),#colorLiteral(red: 0.9337931275, green: 0.5302402377, blue: 0.4974403977, alpha: 1),#colorLiteral(red: 0.9025362134, green: 0.7874186635, blue: 0.6585261226, alpha: 1),#colorLiteral(red: 1, green: 0.9568683505, blue: 0.461269021, alpha: 1),#colorLiteral(red: 0.7825431228, green: 0.965685308, blue: 0.5431290865, alpha: 1),#colorLiteral(red: 0.9395396113, green: 0.7086771131, blue: 0.1930754483, alpha: 1)
                        ]
    
    static func getContentHeight(for text: String, with font: UIFont, width: CGFloat) -> CGFloat {
        let nsstring = NSString(string: text)
        let textAttributes = [NSAttributedString.Key.font : font]
        let boundingRect = nsstring.boundingRect(with: CGSize(width: width, height: maxContentHeight), options: .usesLineFragmentOrigin, attributes: textAttributes, context: nil)
        return ceil(boundingRect.height)
    }
    static func getContentWidth(for text: String, with font: UIFont, width: CGFloat) -> CGFloat {
        let nsstring = NSString(string: text)
        let textAttributes = [NSAttributedString.Key.font : font]
        let boundingRect = nsstring.boundingRect(with: CGSize(width: width, height: maxContentHeight), options: .usesLineFragmentOrigin, attributes: textAttributes, context: nil)
        return ceil(boundingRect.width)
    }
}
