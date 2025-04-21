//
//  Goal+CoreDataProperties.swift
//  GoalLife
//
//  Created by EZen on 2025/04/21.
//
//

import Foundation
import CoreData


extension Goal {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Goal> {
        return NSFetchRequest<Goal>(entityName: "Goal")
    }

    @NSManaged public var currentProgress: Int
    @NSManaged public var goalText: String
    @NSManaged public var targetDate: Date
    @NSManaged public var id: UUID

}

extension Goal : Identifiable {

}
