//
//  ReminderListStyle.swift
//  Today
//
//  Created by Varun Bagga on 11/01/23.
//

import Foundation

enum ReminderListStyle:Int {
    case Today
    case future
    case all
    
    
    var name: String  {
        switch self {
        case.Today :
            return NSLocalizedString("Today", comment: "Today style name")
        case .future:
            return NSLocalizedString("Future", comment: "Future style name")
        case .all:
            return NSLocalizedString("All", comment: "All style name")
        }
    }
    
    func shouldInclude(date:Date)->Bool{
        let isInToday = Locale.current.calendar.isDateInToday(date)
        switch self {
        case .Today:
            return isInToday
        case .future:
            return (date>Date.now) && !isInToday
        case .all:
            return true
        }
    }
}
