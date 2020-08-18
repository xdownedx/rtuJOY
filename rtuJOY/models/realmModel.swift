//
//  realmModel.swift
//  rtuJOY
//
//  Created by Максим Палёхин on 17.08.2020.
//  Copyright © 2020 Максим Палёхин. All rights reserved.
//

import Foundation
import RealmSwift
import Realm

class scheduleDatabase: Object{
    
    @objc dynamic var schedule = Data()
    
    convenience init(scheduleWithJson:Data){
        self.init()
        self.schedule = scheduleWithJson
    }
}
