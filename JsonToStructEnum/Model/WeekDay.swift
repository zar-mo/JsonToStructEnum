//
//  WeekDay.swift
//  JsonToStructEnum
//
//  Created by Abouzar Moradian on 9/17/24.
//

import Foundation

struct Day {
    let name: String
    let weekend: Bool
}

enum WeekDay {
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
    case saturday
    case sunday
    
    
    var day: Day {
        switch self {
        case .monday:
            return Day(name: "Monday", weekend: false)
        case .tuesday:
            return Day(name: "Tuesday", weekend: false)
        case .wednesday:
            return Day(name: "Wednesday", weekend: false)
        case .thursday:
            return Day(name: "Thursday", weekend: false)
        case .friday:
            return Day(name: "Friday", weekend: false)
        case .saturday:
            return Day(name: "Saturday", weekend: true)
        case .sunday:
            return Day(name: "Sunday", weekend: true)
        }
    }
}


enum WeekDays {
    case monday(Day)
    case tuesday(Day)
    case wednesday(Day)
    case thursday(Day)
    case friday(Day)
    case saturday(Day)
    case sunday(Day)
    
}

let monday = WeekDays.monday(Day(name: "monday", weekend: false))


