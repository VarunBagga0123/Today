//
//  ViewController.swift
//  Today
//
//  Created by Varun Bagga on 03/01/23.
//

import UIKit
// USing diffiable datasource
// Diffable data sources manage the state of your data with snapshots. A snapshot represents the state of your data at a specific point in time. To display data using a snapshot, you’ll create the snapshot, populate the snapshot with the state of data that you want to display, and then apply the snapshot in the user interface.
class ReminderListViewController: UICollectionViewController {

//    Type aliases are helpful for referring to an existing type with a name that’s more expressive.
   
    
    var dataSource:DataSource!
    var reminders: [Reminder] = Reminder.sampleData
    var listStylee: ReminderListStyle = .Today
    var filteredReminders : [Reminder] {
        return reminders.filter{listStylee.shouldInclude(date: $0.dueDate)}.sorted{$0.dueDate<$1.dueDate}
    }
    
    let listStyleSegmentedControl = UISegmentedControl(items:[
        ReminderListStyle.Today.name,ReminderListStyle.future.name,ReminderListStyle.all.name
    ])
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let listLayout = listLayout()
        collectionView.collectionViewLayout = listLayout
        
        listStyleSegmentedControl.selectedSegmentIndex = listStylee.rawValue
        navigationItem.titleView = listStyleSegmentedControl
        listStyleSegmentedControl.addTarget(self, action: #selector(didChangeListStyle(_ :)), for: .valueChanged)
        let cellRegistration = UICollectionView.CellRegistration(handler: cellRegistrationHandler)
//        connect the diffable data source to the collection view by passing in the collection view to the diffable data source initializer.
        
        dataSource = DataSource(collectionView: collectionView, cellProvider: { (collectionView: UICollectionView, indexPath: IndexPath, itemIdentifier: Reminder.ID) in
            return collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: itemIdentifier)
        })
        
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(didPressAddButton(_:)))
        addButton.accessibilityLabel = NSLocalizedString("Add reminder", comment: "Add button accessibility label")
        navigationItem.rightBarButtonItem = addButton
        
        updateSnapShot()
        
        
        collectionView.dataSource = dataSource
          
    }
    
// UICollectionViewCompositionalLayout->   A layout object that lets you combine items in highly adaptive and flexible visual arrangements
    
    private func listLayout() -> UICollectionViewCompositionalLayout  {
        
        var listConfiguration = UICollectionLayoutListConfiguration(appearance: .grouped)
        listConfiguration.showsSeparators = false
        listConfiguration.trailingSwipeActionsConfigurationProvider = makeSwipeActions
        listConfiguration.backgroundColor = .clear
        
        return UICollectionViewCompositionalLayout.list(using: listConfiguration)
        
    }
    
    private func makeSwipeActions(for indexPath:IndexPath?)->UISwipeActionsConfiguration?{
        guard let indexPath = indexPath,let id = dataSource.itemIdentifier(for: indexPath) else {return nil}
        let deleActionTitle = NSLocalizedString("Delete", comment: "Delete action title")
        let deleteAction = UIContextualAction(style: .destructive, title: deleActionTitle) { _, _, completion in
            self.deleteReminder(with: id)
            self.updateSnapShot()
            completion(false)
        }
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    
    
    func showDetail(for id:Reminder.ID){
        let reminder = reminder(for: id)
        let viewController = ReminderViewController(reminder: reminder){ [weak self] reminder in
            self?.update(reminder, with: reminder.id)
            self?.updateSnapShot(reloading: [reminder.id])
        }
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        let id = filteredReminders[indexPath.item].id
        showDetail(for: id)
        return false
    }

}

