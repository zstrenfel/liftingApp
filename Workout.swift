//
//  Workout.swift
//  LiftingApp
//
//  Created by Zach Strenfel on 9/5/16.
//  Copyright © 2016 Z&D. All rights reserved.
//

import Foundation
import CoreData

@objc(Workout)
class Workout: NSManagedObject {

// Insert code here to add functionality to your managed object subclass
    override func awakeFromInsert() {
        super.awakeFromInsert()
        self.setPrimitiveValue(NSDate(), forKey: "createdAt")
    }
}
