//
//  StorageManager.swift
//  rtuJOY
//
//  Created by Максим Палёхин on 17.08.2020.
//  Copyright © 2020 Максим Палёхин. All rights reserved.
//

import RealmSwift

 
public class storageManager {
    

    static func saveObject (_ schedule: scheduleDatabase){
        let realm = try! Realm()

        try! realm.write {
            realm.add(schedule)
            
        }
    }
    static func deleteObject(_ schedule: scheduleDatabase){
        let realm = try! Realm()

        try! realm.write {
            realm.delete(schedule)
        }
    }
}
