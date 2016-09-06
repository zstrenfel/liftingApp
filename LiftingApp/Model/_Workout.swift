// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Workout.swift instead.

import Foundation
import CoreData

public enum WorkoutAttributes: String {
    case createdAt = "createdAt"
    case name = "name"
    case updatedAt = "updatedAt"
}

public enum WorkoutRelationships: String {
    case regimen = "regimen"
}

public class _Workout: NSManagedObject {

    // MARK: - Class methods

    public class func entityName () -> String {
        return "Workout"
    }

    public class func entity(managedObjectContext: NSManagedObjectContext) -> NSEntityDescription? {
        return NSEntityDescription.entityForName(self.entityName(), inManagedObjectContext: managedObjectContext)
    }

    // MARK: - Life cycle methods

    public override init(entity: NSEntityDescription, insertIntoManagedObjectContext context: NSManagedObjectContext?) {
        super.init(entity: entity, insertIntoManagedObjectContext: context)
    }

    public convenience init?(managedObjectContext: NSManagedObjectContext) {
        guard let entity = _Workout.entity(managedObjectContext) else { return nil }
        self.init(entity: entity, insertIntoManagedObjectContext: managedObjectContext)
    }

    // MARK: - Properties

    @NSManaged public
    var createdAt: NSDate?

    @NSManaged public
    var name: String?

    @NSManaged public
    var updatedAt: NSDate?

    // MARK: - Relationships

    @NSManaged public
    var regimen: Regimen?

}

