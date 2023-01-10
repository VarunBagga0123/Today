//
//  PriorityContentView.swift
//  Today
//
//  Created by Varun Bagga on 08/01/23.
//

import UIKit

//
//class PriorityContentView: UIView, UIContentView {
//
////    var configuration: UIContentConfiguration{
////        didSet{
////            self.configure(configuration:configuration)
////        }
////    }
////
////    let priorityLabel = UILabel()
////    let prioritySlider = UISlider()
////    var priorityStack = UIStackView()
////
////    init(_ configuration: UIContentConfiguration) {
////        // apply style to the user interface
////        self.configuration = configuration
////
////        priorityStack = UIStackView(arrangedSubviews: [priorityLabel,prioritySlider])
////        priorityStack.axis = .vertical
////        self.addSubview(priorityStack)
////
////        priorityLabel.textAlignment = .center
////        priorityLabel.textColor = .white
////
////        prioritySlider.maximumValue = 10.0
////        prioritySlider.minimumValue = 0.0
////        prioritySlider.addTarget(self, action: #selector(self.sliderValueDidChange(_:)), for: .valueChanged)
////
////        self.configure(configuration:configuration)
////
////    }
////
////    required init?(coder: NSCoder) {
////        fatalError("init(coder:) has not been implemented")
////    }
////
////    func configure(configuration: UIContentConfiguration) {
////        guard let configuration = configuration as? ReminderContentConfiguration else { return }
////        self.priorityLabel.text = configuration.reminder.title + " (priority: \(configuration.reminder.currentPriority))"
////        self.prioritySlider.value = Float(configuration.reminder.currentPriority)
////    }
////
////    @objc func sliderValueDidChange(_ sender: UISlider!) {
////        // snap slider value to integer steps
////        sender.value = round(sender.value)
////        guard var configuration = configuration as? ReminderContentConfiguration else { return }
////        configuration.updatePriority(to: Int(sender.value))
////        self.configure(configuration: configuration)
////    }
////
//}
