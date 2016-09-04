//
//  Regimen.swift
//  LiftingApp
//
//  Created by Zach Strenfel on 9/3/16.
//  Copyright © 2016 Z&D. All rights reserved.
//

import Foundation
import CoreData

@objc(Regimen)
class Regimen: NSManagedObject {

// Insert code here to add functionality to your managed object subclass
    @NSManaged var name: String?
    @NSManaged var createdAt: NSDate?
    @NSManaged var updatedAt: NSDate?

    override func awakeFromInsert() {
        super.awakeFromInsert()
        self.setPrimitiveValue(NSDate(), forKey: "createdAt")
    }
}
