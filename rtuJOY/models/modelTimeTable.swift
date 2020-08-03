//
//  modelTimeTable.swift
//  rtuJOY
//
//  Created by Максим Палёхин on 11.07.2020.
//  Copyright © 2020 Максим Палёхин. All rights reserved.
//

import Foundation
import UIKit

struct schedulePerWeek {
    var day: Array<Array<task>> = []
    init?(tempSchedule:gg){
        let letters = NSCharacterSet.letters
        let decimalCharacters = CharacterSet.decimalDigits
        var idTask=0
        var idDay=0
        var idLesson: Array<Int> = []
        while idTask < tempSchedule.schedule.count-1{
            while idDay < tempSchedule.schedule[idTask].day{
                day.append(Array<task>())
                idLesson.append(Int())
                idLesson[idDay]=0
                idDay+=1
            }
            var idInfo=0
            
            while idInfo < tempSchedule.schedule[idTask].info.count-1{
                if (tempSchedule.schedule[idTask].info[idInfo].name.rangeOfCharacter(from: letters) != nil){
                    day[tempSchedule.schedule[idTask].day-1].append(task())
                    day[tempSchedule.schedule[idTask].day-1][idLesson[tempSchedule.schedule[idTask].day-1]].nameLesson=tempSchedule.schedule[idTask].info[idInfo].name
                    day[tempSchedule.schedule[idTask].day-1][idLesson[tempSchedule.schedule[idTask].day-1]].nameTeacher=tempSchedule.schedule[idTask].info[idInfo].professor
                    day[tempSchedule.schedule[idTask].day-1][idLesson[tempSchedule.schedule[idTask].day-1]].numberAudince="Ауд." + " " + tempSchedule.schedule[idTask].info[idInfo].room
                    day[tempSchedule.schedule[idTask].day-1][idLesson[tempSchedule.schedule[idTask].day-1]].typeLesson=disclosure(closureName: tempSchedule.schedule[idTask].info[idInfo].type)
                    day[tempSchedule.schedule[idTask].day-1][idLesson[tempSchedule.schedule[idTask].day-1]].timeStart=tempSchedule.schedule[idTask].interval.startTime
                    day[tempSchedule.schedule[idTask].day-1][idLesson[tempSchedule.schedule[idTask].day-1]].timeEnd=tempSchedule.schedule[idTask].interval.endTime
                    day[tempSchedule.schedule[idTask].day-1][idLesson[tempSchedule.schedule[idTask].day-1]].number=tempSchedule.schedule[idTask].number
                    
                    if ((tempSchedule.schedule[idTask].info[idInfo].weeks.rangeOfCharacter(from: decimalCharacters)) != nil){
                        let StringRecordedArr = tempSchedule.schedule[idTask].info[idInfo].weeks.components(separatedBy: ",")
                        day[tempSchedule.schedule[idTask].day-1][idLesson[tempSchedule.schedule[idTask].day-1]].week=StringRecordedArr.map { (Int($0) ?? 0)}
                        day[tempSchedule.schedule[idTask].day-1][idLesson[tempSchedule.schedule[idTask].day-1]].week.sort()
                    }else{
                        if (tempSchedule.schedule[idTask].info[idInfo].weeks=="even"){
                            day[tempSchedule.schedule[idTask].day-1][idLesson[tempSchedule.schedule[idTask].day-1]].week=[2,4,6,8,10,12,14,16]
                        }
                        if (tempSchedule.schedule[idTask].info[idInfo].weeks=="odd"){
                            day[tempSchedule.schedule[idTask].day-1][idLesson[tempSchedule.schedule[idTask].day-1]].week=[1,3,5,7,9,11,13,15]
                        }
                    }
                    idLesson[tempSchedule.schedule[idTask].day-1]+=1
                }
                idInfo+=1
            }
            idTask+=1
        }
    }
}



struct task {
    var timeStart:String
    var timeEnd:String
    var typeLesson:String
    var nameLesson:String
    var numberAudince:String
    var nameTeacher:String
    var week: Array<Int>
    var number:Int
    init() {
        timeStart=""
        timeEnd=""
        typeLesson=""
        nameLesson=""
        numberAudince=""
        nameTeacher=""
        number=0
        week=[]
    }
    
}

