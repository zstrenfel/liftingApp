//
//  NSDate+Extensions.swift
//  LiftingApp
//
//  Created by Zach Strenfel on 9/11/16.
//  Copyright © 2016 Z&D. All rights reserved.
//

import Foundation
import UIKit


extension NSDate {
    func calendarFormat() -> String {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "EEEE, MMM d, yyyy"
        return dateFormatter.stringFromDate(self)
    }
}