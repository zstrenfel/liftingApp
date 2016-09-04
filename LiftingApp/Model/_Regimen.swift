// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Regimen.swift instead.

import Foundation
import CoreData

public enum RegimenAttributes: String {
    case createdAt = "createdAt"
    case name = "name"
    case updatedAt = "updatedAt"
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

}

