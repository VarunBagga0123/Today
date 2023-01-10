//
//  ReminderListViewController+Actions.swift
//  Today
//
//  Created by Varun Bagga on 05/01/23.
//

import UIKit

extension ReminderListViewController{
    
    @objc func didPressDoneButton(_ sender:ReminderDoneButton){
        guard let id = sender.id else{
            return
        }
        completeReminder(with: id)
    }
}
