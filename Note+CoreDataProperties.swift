//
//  Note+CoreDataProperties.swift
//  FundooApp
//
//  Created by admin on 21/06/20.
//  Copyright © 2020 admin. All rights reserved.
//
//

import Foundation
import CoreData


extension Note {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Note> {
        return NSFetchRequest<Note>(entityName: "Note")
    }

    @NSManaged public var color: String?
    @NSManaged public var creationTime: Date?
    @NSManaged public var editTime: Date?
    @NSManaged public var note: String?
    @NSManaged public var position: Int64
    @NSManaged public var title: String?
    @NSManaged public var reminder: Date?
    @NSManaged public var owner: User?
    @NSManaged public var labels: NSSet?

}

// MARK: Generated accessors for labels
extension Note {

    @objc(addLabelsObject:)
    @NSManaged public func addToLabels(_ value: Label)

    @objc(removeLabelsObject:)
    @NSManaged public func removeFromLabels(_ value: Label)

    @objc(addLabels:)
    @NSManaged public func addToLabels(_ values: NSSet)

    @objc(removeLabels:)
    @NSManaged public func removeFromLabels(_ values: NSSet)

}
