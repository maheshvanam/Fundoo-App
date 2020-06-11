//
//  Dictionary+Extension.swift
//  FundooApp
//
//  Created by admin on 11/06/20.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation

extension Dictionary where Value: Equatable {
    func getKey(forValue val: Value) -> Key? {
        return first(where: { $1 == val })?.key
    }
}
