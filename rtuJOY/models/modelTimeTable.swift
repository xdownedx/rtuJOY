//
//  modelTimeTable.swift
//  rtuJOY
//
//  Created by Максим Палёхин on 11.07.2020.
//  Copyright © 2020 Максим Палёхин. All rights reserved.
//

import Foundation
import UIKit


struct sheduleGroup:Codable {
    var monday: dayModel?
    var tuesday: dayModel?
    var wednesday: dayModel?
    var thursday: dayModel?
    var friday: dayModel?
    var saturday: dayModel?
}

struct dayModel:Codable {
    var firstTask: task?
    var secondTask: task?
    var thirdTask: task?
    var fourthTask: task?
    var fifthTask: task?
    var sixthTask: task?
    var seventhTask: task?
    var eighthTask: task?
}

struct task:Codable {
    var timeStart:String
    var timeEnd:String
    var typeLesson:String
    var nameLesson:String
    var numberAudince:String
    var nameTeacher:String
    var addressCampus:String
}


//class Shedule {
//    var timeStart:String
//    var timeEnd:String
//    var typeLesson:String
//    var nameLesson:String?
//    var numberAudince:String?
//    var nameTeacher:String?
//    var addressCampus:String?
//
//    init(timeStart:String,timeEnd:String,typeLesson:String,nameLesson:String,numberAudince:String,nameTeacher:String, addressCampus:String) {
//        self.timeStart = timeStart
//        self.timeEnd = timeEnd
//        self.typeLesson = typeLesson
//        self.nameLesson = nameLesson
//        self.numberAudince = numberAudince
//        self.nameTeacher = nameTeacher
//        self.addressCampus = addressCampus
//    }
//}
