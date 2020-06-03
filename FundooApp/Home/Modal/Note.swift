//
//  Note.swift
//  FundooApp
//
//  Created by admin on 03/06/20.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation
import CoreData
class Note:NSManagedObject {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "Note")
    }
    @NSManaged public var title: String?
    @NSManaged public var note: String?
}
