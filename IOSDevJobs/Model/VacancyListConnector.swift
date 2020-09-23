//
//  VacancyListConnector.swift
//  IOSDevJobs
//
//  Created by Роенко Денис on 17.08.2020.
//  Copyright © 2020 Denis Roenko. All rights reserved.
//

import FirebaseDatabase
import CodableFirebase

class VacancyListConnector: ObservableObject {
    @Published var list = [VacancyModel]()
    
    init() {
        var ref: DatabaseReference!
        ref = Database.database().reference()
        let child = ref.child("vacancy list")
        child.observeSingleEvent(of: .value, with: { (snapshot) in
            if let value = snapshot.value {
                do {
                    self.list = try FirebaseDecoder().decode([VacancyModel].self, from: value)
                    print("FirebaseDecoder work finished!")
                    
                } catch let error {
                    print(error.localizedDescription)
                }
            }
        }) { (error) in
            print(error.localizedDescription)
        }
        
    }
    
}
