//
//  CoreDataStack.swift
//  iosToDoapp
//
//  Created by Kaughlin Caver on 12/17/18.
//  Copyright © 2018 Kaughlin Caver. All rights reserved.
//

import Foundation
import CoreData
class CoreDataStack{
    var container: NSPersistentContainer {
        let container = NSPersistentContainer(name: "Todos")
        container.loadPersistentStores{ (description, error) in
            guard error == nil else {
                print("Error: \(error!)")
                return
            }
        }
        return container
    }
    var managedContext: NSManagedObjectContext{
        return container.viewContext
    }
}
