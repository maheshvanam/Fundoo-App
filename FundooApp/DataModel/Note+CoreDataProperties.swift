//
//  Note+CoreDataProperties.swift
//  FundooApp
//
//  Created by admin on 09/06/20.
//  Copyright © 2020 admin. All rights reserved.
//
//

import Foundation
import CoreData


extension Note {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Note> {
        return NSFetchRequest<Note>(entityName: "Note")
    }

    @NSManaged public var note: String?
    @NSManaged public var title: String?
    @NSManaged public var creationTime: String?
    @NSManaged public var editTime: String?
    @NSManaged public var color: String?
    @NSManaged public var owner: User?

}
