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
//This model for saving deadline and json in memory phone
class scheduleDatabase: Object{
    
    @objc dynamic var schedule = Data()
    
    convenience init(scheduleWithJson:Data){
        self.init()
        self.schedule = scheduleWithJson
    }
}

class deadlineTask: Object{
    
    @objc dynamic var nameLesson = ""
    @objc dynamic var deadlineTask = ""
    @objc dynamic var deadlineTime = ""
    @objc dynamic var deadlineIsReady = false   //переменная для отметки выполненных заданий
    convenience init(nameLesson:String, deadlineTask:String, deadlineTime:String, deadlineIsReady:Bool ){
        self.init()
        self.nameLesson = nameLesson
        self.deadlineTask = deadlineTask
        self.deadlineTime = deadlineTime
        self.deadlineIsReady = deadlineIsReady
    }
}
