//
//  Friend.swift
//  Birthdays
//
//  Created by Neil Thorne on 6/11/25.
//

import Foundation
import SwiftData

@Model
class Friend {
    var name: String
    var birthday: Date
    
    init(name: String, birthday: Date) {
        self.name = name
        self.birthday = birthday
    }
    
    var isBirthdayToday: Bool {
        Calendar.current.isDateInToday(birthday)
    }
}
