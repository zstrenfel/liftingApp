// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Regimen.swift instead.

import Foundation
import CoreData

public enum RegimenAttributes: String {
    case createdAt = "createdAt"
    case name = "name"
    case updatedAt = "updatedAt"
}

public enum RegimenRelationships: String {
    case workouts = "workouts"
}

public class _Regimen: NSManagedObject {

    // MARK: - Class methods

    public class func entityName () -> String {
        return "Regimen"
    }

    public class func entity(managedObjectContext: NSManagedObjectContext) -> NSEntityDescription? {
        return NSEntityDescription.entityForName(self.entityName(), inManagedObjectContext: managedObjectContext)
    }

    // MARK: - Life cycle methods

    public override init(entity: NSEntityDescription, insertIntoManagedObjectContext context: NSManagedObjectContext?) {
        super.init(entity: entity, insertIntoManagedObjectContext: context)
    }

    public convenience init?(managedObjectContext: NSManagedObjectContext) {
        guard let entity = _Regimen.entity(managedObjectContext) else { return nil }
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
    var workouts: NSSet

}

extension _Regimen {

    func addWorkouts(objects: NSSet) {
        let mutable = self.workouts.mutableCopy() as! NSMutableSet
        mutable.unionSet(objects as Set<NSObject>)
        self.workouts = mutable.copy() as! NSSet
    }

    func removeWorkouts(objects: NSSet) {
        let mutable = self.workouts.mutableCopy() as! NSMutableSet
        mutable.minusSet(objects as Set<NSObject>)
        self.workouts = mutable.copy() as! NSSet
    }

    func addWorkoutsObject(value: Workout) {
        let mutable = self.workouts.mutableCopy() as! NSMutableSet
        mutable.addObject(value)
        self.workouts = mutable.copy() as! NSSet
    }

    func removeWorkoutsObject(value: Workout) {
        let mutable = self.workouts.mutableCopy() as! NSMutableSet
        mutable.removeObject(value)
        self.workouts = mutable.copy() as! NSSet
    }

}

