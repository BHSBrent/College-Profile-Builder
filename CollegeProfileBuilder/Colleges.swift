//
//  Colleges.swift
//  CollegeProfileBuilder
//
//  Created by Brent Behling on 2/13/17.
//  Copyright © 2017 Brent Behling. All rights reserved.
//

import UIKit
import RealmSwift

class Colleges : Object {
    
    dynamic var name = String()
    dynamic var location = String()
    dynamic var attendance = Int()
    dynamic var logo = Data()
    
    convenience init(name: String, location: String, attendance: Int, logo: Data) {
        self.init()
        self.name = name
        self.location = location
        self.attendance = attendance
        self.logo = logo
    }
}
