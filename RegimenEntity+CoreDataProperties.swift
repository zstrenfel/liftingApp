//
//  RegimenEntity+CoreDataProperties.swift
//  LiftingApp
//
//  Created by Zach Strenfel on 9/3/16.
//  Copyright © 2016 Z&D. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension RegimenEntity {

    @NSManaged var name: String?
    @NSManaged var createdAt: NSDate?
    @NSManaged var updatedAt: NSDate?

}
