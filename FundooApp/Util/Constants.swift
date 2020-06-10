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
    static let REMINDER = 1
    static let SIGN_OUT = 5
    static let HOME = 0
    static let colors = ["white" : UIColor.white,"yellow":UIColor.yellow,"green":UIColor.green,"black":UIColor.black,"purple":UIColor.purple,"red":UIColor.red,"orange":UIColor.orange,"lightGray":UIColor.lightGray]
}
extension Dictionary where Value: Equatable {
    func getKey(forValue val: Value) -> Key? {
        return first(where: { $1 == val })?.key
    }
}
