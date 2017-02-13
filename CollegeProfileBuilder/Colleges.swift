//
//  Colleges.swift
//  CollegeProfileBuilder
//
//  Created by Brent Behling on 2/13/17.
//  Copyright © 2017 Brent Behling. All rights reserved.
//

import UIKit

class Colleges: NSObject {
    
    var name = String()
    var location = String()
    var attendance = Int()
    var logo = Data()
    
    convenience init(name: String, location: String, attendance: Int, logo: Data) {
        self.init()
        self.name = name
        self.location = location
        self.attendance = attendance
        self.logo = logo
    }
}
