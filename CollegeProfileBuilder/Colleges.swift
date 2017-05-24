//
//  Colleges.swift
//  CollegeProfileBuilder
//
//  Created by Brent Behling on 2/13/17.
//  Copyright © 2017 Brent Behling. All rights reserved.
//

import UIKit
import RealmSwift
import SafariServices

class Colleges : Object {
    
    dynamic var name = String()
    dynamic var location = String()
    dynamic var attendance = Int()
    dynamic var logo = Data()
    dynamic var website = String()
    
    convenience init(name: String, location: String, attendance: Int, logo: Data, website: String) {
        self.init()
        self.name = name
        self.location = location
        self.attendance = attendance
        self.logo = logo
        self.website = website
    }
}
