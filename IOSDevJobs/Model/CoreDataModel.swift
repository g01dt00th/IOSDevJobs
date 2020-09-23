//
//  CoreDataModel.swift
//  IOSDevJobs
//
//  Created by Роенко Денис on 30.07.2020.
//  Copyright © 2020 Denis Roenko. All rights reserved.
//

import CoreData


final class CoreDataModel: NSObject {
    var data: [NSManagedObject] = []
    var developerLevel: String?
    var userType: String?
    
    let context = CoreDataConnector.persistentContainer.viewContext
    
    override init(){
        super.init()
        readData()
    }
    
    func readData() {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "CDUserModel")
        do {
            
            let results = try context.fetch(request)
            self.data = results as! [NSManagedObject]
            
            for object in data {
                developerLevel = getValue(obj: object, forKey: "developerLevel")
                userType = getValue(obj: object, forKey: "userType")
            }
            
        } catch {
            print(error.localizedDescription)
        }
        

    }
    
    func writeData(value: Any?, forKey: String) {
        let entity = NSEntityDescription.insertNewObject(forEntityName: "CDUserModel", into: context)
        entity.setValue(value, forKey: forKey)
        
        do {
            try context.save()
            // if success - append data to array
            self.data.append(entity)
            
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func deleteAllData() {
        for obj in data{
            do {
                context.delete(obj)
                try context.save()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    func getValue(obj: NSManagedObject, forKey: String) -> String? {
        return obj.value(forKey: forKey) as? String
    }
}
