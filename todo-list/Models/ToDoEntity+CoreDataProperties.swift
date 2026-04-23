//
//  ToDoEntity+CoreDataProperties.swift
//  todo-list
//
//  Created by Camilo on 4/22/26.
//
//

import Foundation
import CoreData


extension ToDoEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ToDoEntity> {
        return NSFetchRequest<ToDoEntity>(entityName: "ToDoEntity")
    }

    @NSManaged public var isArchieved: Bool
    @NSManaged public var isComplete: Bool
    @NSManaged public var date: Date?
    @NSManaged public var note: String?
    @NSManaged public var title: String?
    @NSManaged public var id: String?

}

extension ToDoEntity : Identifiable {

}
