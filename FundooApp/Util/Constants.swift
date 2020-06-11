//
//  Constants.swift
//  FundooApp
//
//  Created by admin on 04/06/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class Constants {
    static let TOGGLE_MENU = "TOGGLE_MENU"
    static let SET_BACK_BUTTON = "SET_BACK_BUTTON"
    static let UPDATE_NAV = "UPDATE_NAV"
    static let SET_MENU = "SET_MENU"
    static let EMAIL_KEY = "EMAIL"
    static let IS_LOGGED_IN_KEY = "IS_LOGGED_IN"
    static let NAVIGATE_TO_NOTE = "HOME"
    static let NAVIGATE_TO_REMINDER = "REMINDER"
    static let TOGGLE_GRID = "TOGGLE_GRID"
    static let ADD_NOTE = "Add Note"
    static let RELOAD_CELLS = "Reload cells"
    static let UPDATE_COLOR = "update color"
    static let OPTIONS_CELL_ID = "OptionsCell"
    static let CollectionView_TabelCell_ID = "CollectionViewTabelCell"
    static let COLOR_KEY = "color"
    static let NOTES_TITLE = "Notes"
    static let HOME_STORYBOARD = "Home"
    static let MAIN_STORYBOARD = "Main"
    static let EDIT_NOTE_VC = "EditNoteVC"
    static let REMINDER_VC = "ReminderViewController"
    static let USER_NOT_FOUND = "user not found"
    static let FETCH_ERROR = "fetching error"
    static let SIGN_UP_TITLE = "Sign Up"
    static let SIGN_IN_TITLE = "Sign In"
    static let REMINDER = 1
    static let FLOAT_TEN: CGFloat = 10
    static let FLOAT_ZERO: CGFloat = 0
    static let FLOAT_1: CGFloat = 1
    static let FLOAT_2: CGFloat = 2
    static let FLOAT_5: CGFloat = 5
    static let FLOAT_60: CGFloat = 60
    static let FLOAT_15: CGFloat = 15
    static let FLOAT_190: CGFloat = 190
    static let FLOAT_350: CGFloat = 350
    static let INT_1 = 1
    static let INT_0 = 0
    static let INT_2 = 2
    
    
    static let SIGN_OUT = 5
    static let HOME = 0
    static let HEIGHT_ANCHOR_300:CGFloat = 300
    static let HEIGHT_ANCHOR_ZERO:CGFloat = 0
    
    static let colors = ["white":#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1),"darkBlue": #colorLiteral(red: 0.5135223269, green: 0.6951187253, blue: 0.9883810878, alpha: 1),"pink":#colorLiteral(red: 0.9528250098, green: 0.7310573459, blue: 0.8114919066, alpha: 1),"brown":#colorLiteral(red: 0.8455398679, green: 0.8021178842, blue: 0.7904801965, alpha: 1),"purple":#colorLiteral(red: 0.7030208111, green: 0.5371930599, blue: 0.993486464, alpha: 1),"green":#colorLiteral(red: 0.6462398171, green: 0.9788334966, blue: 0.9230322838, alpha: 1),"blue":#colorLiteral(red: 0.504642725, green: 0.846619904, blue: 0.9870195985, alpha: 1),"red":#colorLiteral(red: 0.9337931275, green: 0.5302402377, blue: 0.4974403977, alpha: 1),"darkBrown":#colorLiteral(red: 0.9025362134, green: 0.7874186635, blue: 0.6585261226, alpha: 1),"yellow":#colorLiteral(red: 1, green: 0.9568683505, blue: 0.461269021, alpha: 1),"lightGreen":#colorLiteral(red: 0.7825431228, green: 0.965685308, blue: 0.5431290865, alpha: 1),"orange":#colorLiteral(red: 0.9395396113, green: 0.7086771131, blue: 0.1930754483, alpha: 1)
        ]
    
    static let myColors = [
                            #colorLiteral(red: 0.5135223269, green: 0.6951187253, blue: 0.9883810878, alpha: 1),#colorLiteral(red: 0.9528250098, green: 0.7310573459, blue: 0.8114919066, alpha: 1),#colorLiteral(red: 0.8455398679, green: 0.8021178842, blue: 0.7904801965, alpha: 1),#colorLiteral(red: 0.7030208111, green: 0.5371930599, blue: 0.993486464, alpha: 1),#colorLiteral(red: 0.6462398171, green: 0.9788334966, blue: 0.9230322838, alpha: 1),#colorLiteral(red: 0.504642725, green: 0.846619904, blue: 0.9870195985, alpha: 1),#colorLiteral(red: 0.9337931275, green: 0.5302402377, blue: 0.4974403977, alpha: 1),#colorLiteral(red: 0.9025362134, green: 0.7874186635, blue: 0.6585261226, alpha: 1),#colorLiteral(red: 1, green: 0.9568683505, blue: 0.461269021, alpha: 1),#colorLiteral(red: 0.7825431228, green: 0.965685308, blue: 0.5431290865, alpha: 1),#colorLiteral(red: 0.9395396113, green: 0.7086771131, blue: 0.1930754483, alpha: 1)
                            ]
}

extension Dictionary where Value: Equatable {
    func getKey(forValue val: Value) -> Key? {
        return first(where: { $1 == val })?.key
    }
}
