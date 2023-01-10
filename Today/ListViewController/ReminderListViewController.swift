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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let listLayout = listLayout()
        collectionView.collectionViewLayout = listLayout
        
        //cell registration
        
        let cellRegistration = UICollectionView.CellRegistration(handler: cellRegistrationHandler)
//        connect the diffable data source to the collection view by passing in the collection view to the diffable data source initializer.
        
        dataSource = DataSource(collectionView: collectionView, cellProvider: { (collectionView: UICollectionView, indexPath: IndexPath, itemIdentifier: Reminder.ID) in
            return collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: itemIdentifier)
        })
        
        updateSnapShot()
        
        
        collectionView.dataSource = dataSource
          
    }
    
// UICollectionViewCompositionalLayout->   A layout object that lets you combine items in highly adaptive and flexible visual arrangements
    
    private func listLayout() -> UICollectionViewCompositionalLayout  {
        
        var listConfiguration = UICollectionLayoutListConfiguration(appearance: .grouped)
        listConfiguration.showsSeparators = false
        listConfiguration.backgroundColor = .clear
        
        return UICollectionViewCompositionalLayout.list(using: listConfiguration)
        
    }
    
    
    func showDetail(for id:Reminder.ID){
        let reminder = reminder(for: id)
        let viewController = ReminderViewController(reminder: reminder)
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        let id = reminders[indexPath.item].id
        showDetail(for: id)
        return false
    }
    
    
   


}

