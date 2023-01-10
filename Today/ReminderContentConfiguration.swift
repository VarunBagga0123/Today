//
//  ReminderContentConfiguration.swift
//  Today
//
//  Created by Varun Bagga on 09/01/23.
//
//
//import Foundation
//import UIKit
//
//struct ReminderContentConfiguration: UIContentConfiguration {
//    var reminder: Reminder // a copy of the model
//    
//    func makeContentView() -> UIView & UIContentView {
//        return PriorityContentView(self)
//    }
//    func updated(for state: UIConfigurationState) -> ReminderContentConfiguration {
//        return self
//    }
//    mutating func updatePriority(to newPriority: Int) {
//        reminder.currentPriority = newPriority
//    }
//}
