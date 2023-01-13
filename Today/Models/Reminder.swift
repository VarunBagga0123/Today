//
//  Reminder.swift
//  Today
//
//  Created by Varun Bagga on 03/01/23.
//

import Foundation


//You use identifiers to inform the data source of which items to include in the collection view and which items to reload when data changes. In the last tutorial, you used a reminder’s title as an identifier. Consider what would happen if a user were to change the title or create two reminders with the same title.

struct Reminder:Equatable,Identifiable{
    
    var id: String = UUID().uuidString
    var title : String
    var dueDate : Date
    var notes : String? = nil
    var isComplete : Bool = false
    var currentPriority : Float = 0.0
}

extension Array where Element == Reminder{
    
    func indexOfReminder(with id:Reminder.ID)-> Self.Index {
        guard let index = firstIndex(where: {$0.id == id}) else{
            fatalError()
        }
        return index
    }
    
}

//The #if DEBUG flag is a compilation directive that prevents the enclosed code from compiling when you build the app for release. You can use this flag for testing code in debug builds — or for providing sample test data, like you’ll do in the next step.
#if DEBUG
extension Reminder {
    static var sampleData = [
        Reminder(title: "Submit reimbursement report", dueDate: Date().addingTimeInterval(800.0), notes: "Don't forget about taxi receipts"),
        Reminder(title: "Code review", dueDate: Date().addingTimeInterval(14000.0), notes: "Check tech specs in shared folder", isComplete: true),
        Reminder(title: "Pick up new contacts", dueDate: Date().addingTimeInterval(24000.0), notes: "Optometrist closes at 6:00PM"),
        Reminder(title: "Add notes to retrospective", dueDate: Date().addingTimeInterval(3200.0), notes: "Collaborate with project manager", isComplete: true),
        Reminder(title: "Interview new project manager candidate", dueDate: Date().addingTimeInterval(60000.0), notes: "Review portfolio"),
        Reminder(title: "Mock up onboarding experience", dueDate: Date().addingTimeInterval(72000.0), notes: "Think different"),
        Reminder(title: "Review usage analytics", dueDate: Date().addingTimeInterval(83000.0), notes: "Discuss trends with management"),
        Reminder(title: "Confirm group reservation", dueDate: Date().addingTimeInterval(92500.0), notes: "Ask about space heaters"),
        Reminder(title: "Add beta testers to TestFlight", dueDate: Date().addingTimeInterval(101000.0),  notes: "v0.9 out on Friday")
    ]
}
#endif
