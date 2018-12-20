//
//  TodoTableViewController.swift
//  iosToDoapp
//
//  Created by Kaughlin Caver on 12/14/18.
//  Copyright © 2018 Kaughlin Caver. All rights reserved.
//

import UIKit
import CoreData

class TodoTableViewController: UITableViewController {
    
    //MARK: - Properties
    var resultsController: NSFetchedResultsController<Todo>!
    let coreDataStack = CoreDataStack()
        
    

    override func viewDidLoad() {
        super.viewDidLoad()

        //Request
        let request: NSFetchRequest<Todo> = Todo.fetchRequest()
        let sortDescriptor = NSSortDescriptor(key: "date", ascending: true)
        
        //initialize results controller
        request.sortDescriptors = [sortDescriptor]
        resultsController = NSFetchedResultsController(
            fetchRequest: request,
            managedObjectContext: coreDataStack.managedContext,
            sectionNameKeyPath: nil,
            cacheName: nil
        )
        
        //Now fetch our data
        do {
            try resultsController.performFetch()
        } catch {
            print("Perform fetch error: \(error)")
        }
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return resultsController.sections?[section].objects?.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoCell", for: indexPath)

        // Configure the cell...
        let todo = resultsController.object(at: indexPath)
        cell.textLabel?.text = todo.title

        return cell
    }
    
    //MARK: - Table view delegate
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .destructive, title: "Delete") {(action, view, completion) in
            //TODO-- delete todo
            completion(true)
        }
        //action.image = trash
        action.backgroundColor =  .red
        return UISwipeActionsConfiguration(actions: [action])
    }
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .destructive, title: "Check") {(action, view, completion) in
            //TODO-- delete todo
            completion(true)
        }
        //action.image = check
        action.backgroundColor =  .green
        return UISwipeActionsConfiguration(actions: [action])
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if let _ = sender as? UIBarButtonItem, let vc = segue.destination as? AddTodoViewController{
            vc.managedContext = coreDataStack.managedContext
        }
    }
    

}
