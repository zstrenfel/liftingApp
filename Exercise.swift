//
//  Exercise.swift
//  LiftingApp
//
//  Created by Zach Strenfel on 9/11/16.
//  Copyright © 2016 Z&D. All rights reserved.
//

import Foundation
import CoreData

@objc(Exercise)
class Exercise: NSManagedObject {

// Insert code here to add functionality to your managed object subclass
    override func awakeFromInsert() {
        super.awakeFromInsert()
        self.setPrimitiveValue(NSDate(), forKey: "createdAt")
    }
}

extension Exercise {
    
    @NSManaged var repetitions: NSNumber?
    @NSManaged var weight: NSNumber?
    @NSManaged var created_at: NSDate?
    @NSManaged var updated_at: NSDate?
    @NSManaged var name: String?
    @NSManaged var workout: Workout?
    
}
