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
    var monday: Array<task> = []
    var tuesday: Array<task> = []
    var wednesday: Array<task> = []
    var thursday: Array<task> = []
    var friday: Array<task> = []
    var saturday: Array<task> = []
    
    
    init?(tempSchedule:gg){
        var i=0
        
        
        while(i<(tempSchedule.schedule.count-1)){
            switch tempSchedule.schedule[i].day {
            case 1:
                monday.append(.init())
                monday[tempSchedule.schedule[i].number].timeStart+=tempSchedule.schedule[i].interval.startTime
                monday[tempSchedule.schedule[i].number].timeEnd+=tempSchedule.schedule[i].interval.endTime
                monday[tempSchedule.schedule[i].number].nameLesson+=tempSchedule.schedule[i].info[0].name
                monday[tempSchedule.schedule[i].number].typeLesson+=tempSchedule.schedule[i].info[0].type
                monday[tempSchedule.schedule[i].number].nameTeacher+=tempSchedule.schedule[i].info[0].professor
                monday[tempSchedule.schedule[i].number].numberAudince+=tempSchedule.schedule[i].info[0].room
                //monday[tempSchedule.schedule[i].number].week+=tempSchedule.schedule[i].info[0].weeks+","+tempSchedule.schedule[i].info[2].weeks
                
                var j = 0
                while  j<tempSchedule.schedule[i].info.count {
                    if (tempSchedule.schedule[i].info[j].weeks != "odd")&&(tempSchedule.schedule[i].info[j].weeks != "even"){
                        let StringRecordedArr = tempSchedule.schedule[i].info[j].weeks.components(separatedBy: ",")
                        monday[tempSchedule.schedule[i].number].week+=StringRecordedArr.map { Int($0)!}
                        monday[tempSchedule.schedule[i].number].week.sort()
                    }
                    j+=1
                    
                }
                
                
            case 2:
                tuesday.append(.init())
                tuesday[tempSchedule.schedule[i].number].timeStart+=tempSchedule.schedule[i].interval.startTime
                tuesday[tempSchedule.schedule[i].number].timeEnd+=tempSchedule.schedule[i].interval.endTime
                tuesday[tempSchedule.schedule[i].number].nameLesson+=tempSchedule.schedule[i].info[0].name
                tuesday[tempSchedule.schedule[i].number].typeLesson+=tempSchedule.schedule[i].info[0].type
                tuesday[tempSchedule.schedule[i].number].nameTeacher+=tempSchedule.schedule[i].info[0].professor
                tuesday[tempSchedule.schedule[i].number].numberAudince+=tempSchedule.schedule[i].info[0].room
                //tuesday[tempSchedule.schedule[i].number].week+=tempSchedule.schedule[i].info[0].weeks+","+tempSchedule.schedule[i].info[1].weeks
                
                var j = 0
                while  j<tempSchedule.schedule[i].info.count {
                    if (tempSchedule.schedule[i].info[j].weeks != "odd")&&(tempSchedule.schedule[i].info[j].weeks != "even"){
                        let StringRecordedArr = tempSchedule.schedule[i].info[j].weeks.components(separatedBy: ",")
                        tuesday[tempSchedule.schedule[i].number].week+=StringRecordedArr.map { Int($0)!}
                        tuesday[tempSchedule.schedule[i].number].week.sort()
                    }
                    j+=1
                    
                }
            case 3:
                wednesday.append(.init())
                wednesday[tempSchedule.schedule[i].number].timeStart+=tempSchedule.schedule[i].interval.startTime
                wednesday[tempSchedule.schedule[i].number].timeEnd+=tempSchedule.schedule[i].interval.endTime
                wednesday[tempSchedule.schedule[i].number].nameLesson+=tempSchedule.schedule[i].info[0].name
                wednesday[tempSchedule.schedule[i].number].typeLesson+=tempSchedule.schedule[i].info[0].type
                wednesday[tempSchedule.schedule[i].number].nameTeacher+=tempSchedule.schedule[i].info[0].professor
                wednesday[tempSchedule.schedule[i].number].numberAudince+=tempSchedule.schedule[i].info[0].room
                var j = 0
                while  j<tempSchedule.schedule[i].info.count {
                    if (tempSchedule.schedule[i].info[j].weeks != "odd")&&(tempSchedule.schedule[i].info[j].weeks != "even"){
                        let StringRecordedArr = tempSchedule.schedule[i].info[j].weeks.components(separatedBy: ",")
                        wednesday[tempSchedule.schedule[i].number].week+=StringRecordedArr.map { Int($0)!}
                        wednesday[tempSchedule.schedule[i].number].week.sort()
                    }
                    j+=1
                    
                }
            //wednesday[tempSchedule.schedule[i].number].week+=tempSchedule.schedule[i].info[0].weeks+","+tempSchedule.schedule[i].info[2].weeks
            case 4:
                thursday.append(.init())
                thursday[tempSchedule.schedule[i].number].timeStart+=tempSchedule.schedule[i].interval.startTime
                thursday[tempSchedule.schedule[i].number].timeEnd+=tempSchedule.schedule[i].interval.endTime
                thursday[tempSchedule.schedule[i].number].nameLesson+=tempSchedule.schedule[i].info[0].name
                thursday[tempSchedule.schedule[i].number].typeLesson+=tempSchedule.schedule[i].info[0].type
                thursday[tempSchedule.schedule[i].number].nameTeacher+=tempSchedule.schedule[i].info[0].professor
                thursday[tempSchedule.schedule[i].number].numberAudince+=tempSchedule.schedule[i].info[0].room
                var j = 0
                while  j<tempSchedule.schedule[i].info.count {
                    if (tempSchedule.schedule[i].info[j].weeks != "odd")&&(tempSchedule.schedule[i].info[j].weeks != "even"){
                        let StringRecordedArr = tempSchedule.schedule[i].info[j].weeks.components(separatedBy: ",")
                        thursday[tempSchedule.schedule[i].number].week+=StringRecordedArr.map { Int($0)!}
                        thursday[tempSchedule.schedule[i].number].week.sort()
                    }
                    j+=1
                    
                }
            //thursday[tempSchedule.schedule[i].number].week+=tempSchedule.schedule[i].info[0].weeks+","+tempSchedule.schedule[i].info[2].weeks
            case 5:
                friday.append(.init())
                friday[tempSchedule.schedule[i].number].timeStart+=tempSchedule.schedule[i].interval.startTime
                friday[tempSchedule.schedule[i].number].timeEnd+=tempSchedule.schedule[i].interval.endTime
                friday[tempSchedule.schedule[i].number].nameLesson+=tempSchedule.schedule[i].info[0].name
                friday[tempSchedule.schedule[i].number].typeLesson+=tempSchedule.schedule[i].info[0].type
                friday[tempSchedule.schedule[i].number].nameTeacher+=tempSchedule.schedule[i].info[0].professor
                friday[tempSchedule.schedule[i].number].numberAudince+=tempSchedule.schedule[i].info[0].room
               var j = 0
                while  j<tempSchedule.schedule[i].info.count {
                    if (tempSchedule.schedule[i].info[j].weeks != "odd")&&(tempSchedule.schedule[i].info[j].weeks != "even"){
                        let StringRecordedArr = tempSchedule.schedule[i].info[j].weeks.components(separatedBy: ",")
                        friday[tempSchedule.schedule[i].number].week+=StringRecordedArr.map { Int($0)!}
                        friday[tempSchedule.schedule[i].number].week.sort()
                    }
                    j+=1
                    
                }
            //friday[tempSchedule.schedule[i].number].week+=tempSchedule.schedule[i].info[0].weeks+","+tempSchedule.schedule[i].info[2].weeks
            case 6:
                saturday.append(.init())
                saturday[tempSchedule.schedule[i].number].timeStart+=tempSchedule.schedule[i].interval.startTime
                saturday[tempSchedule.schedule[i].number].timeEnd+=tempSchedule.schedule[i].interval.endTime
                saturday[tempSchedule.schedule[i].number].nameLesson+=tempSchedule.schedule[i].info[0].name
                saturday[tempSchedule.schedule[i].number].typeLesson+=tempSchedule.schedule[i].info[0].type
                saturday[tempSchedule.schedule[i].number].nameTeacher+=tempSchedule.schedule[i].info[0].professor
                saturday[tempSchedule.schedule[i].number].numberAudince+=tempSchedule.schedule[i].info[0].room
                var j = 0
                while  j<tempSchedule.schedule[i].info.count {
                    if (tempSchedule.schedule[i].info[j].weeks != "odd")&&(tempSchedule.schedule[i].info[j].weeks != "even"){
                        let StringRecordedArr = tempSchedule.schedule[i].info[j].weeks.components(separatedBy: ",")
                        saturday[tempSchedule.schedule[i].number].week+=StringRecordedArr.map { Int($0)!}
                        saturday[tempSchedule.schedule[i].number].week.sort()
                    }
                    j+=1
                    
                }
            //saturday[tempSchedule.schedule[i].number].week+=tempSchedule.schedule[i].info[0].weeks+","+tempSchedule.schedule[i].info[2].weeks
            default:
                return
            }
            i+=1
            
            
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
    init() {
        timeStart=""
        timeEnd=""
        typeLesson=""
        nameLesson=""
        numberAudince=""
        nameTeacher=""
        week=[]
    }
    
}

