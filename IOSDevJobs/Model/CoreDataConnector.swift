//
//  CoreDataConnektor.swift
//  IOSDevJobs
//
//  Created by Роенко Денис on 30.07.2020.
//  Copyright © 2020 Denis Roenko. All rights reserved.
//

import CoreData

final class CoreDataConnector: NSObject {

    
    static var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "CDUserModel")
        container.loadPersistentStores(completionHandler: { storeDesriprion, error  in
            if let nserror = error as NSError? {
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        })
        return container
    }()

    static func saveContex() {
        let contex = persistentContainer.viewContext
        if contex.hasChanges {
            do {
                try contex.save()
            } catch {
                let nserror = error as NSError
               fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

}
