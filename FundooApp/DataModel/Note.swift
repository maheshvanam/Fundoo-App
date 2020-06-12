//
//  Note+CoreDataClass.swift
//  FundooApp
//
//  Created by admin on 04/06/20.
//  Copyright © 2020 admin. All rights reserved.
//
//

import Foundation
import CoreData

public class Note: NSManagedObject {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Note> {
        return NSFetchRequest<Note>(entityName: "Note")
    }

    @NSManaged public var color: String?
    @NSManaged public var creationTime: Date?
    @NSManaged public var editTime: Date?
    @NSManaged public var note: String?
    @NSManaged public var title: String?
    @NSManaged public var owner: User?
}

