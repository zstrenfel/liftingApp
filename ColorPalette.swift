//
//  ColorPalette.swift
//  LiftingApp
//
//  Created by Zach Strenfel on 9/5/16.
//  Copyright © 2016 Z&D. All rights reserved.
//

import Foundation
import UIKit

struct ColorPalette {
    static let Red = UIColor(red: 217/255, green: 30/255, blue: 24/255, alpha: 1)
    static let Green = UIColor(red: 0.0, green: 0.5628, blue: 0.3188, alpha: 1.0)
    static let Blue = UIColor(red: 107/255, green: 185/255, blue: 240/255, alpha: 1.0)
    
    struct Gray {
        static let Light = UIColor(white: 0.8374, alpha: 1.0)
        static let Medium = UIColor(white: 0.4756, alpha: 1.0)
        static let Dark = UIColor(white: 0.2605, alpha: 1.0)
    }
}
