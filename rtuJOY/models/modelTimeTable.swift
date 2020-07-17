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
        let decimalCharacters = CharacterSet.decimalDigits
        var idMn=0
        var idTd=0
        var idWd=0
        var idTh=0
        var idFd=0
        var idSt=0
        
        while(i<(tempSchedule.schedule.count-1)){
            switch tempSchedule.schedule[i].day {
            case 1:
                var k=0
                while (k < tempSchedule.schedule[i].info.count-1){
                    if tempSchedule.schedule[i].info[k].name != ""{
                        monday.append(.init())
                        monday[idMn].timeStart+=tempSchedule.schedule[i].interval.startTime
                        monday[idMn].timeEnd+=tempSchedule.schedule[i].interval.endTime
                        monday[idMn].nameLesson+=tempSchedule.schedule[i].info[k].name
                        monday[idMn].typeLesson+=tempSchedule.schedule[i].info[k].type
                        monday[idMn].nameTeacher+=tempSchedule.schedule[i].info[k].professor
                        monday[idMn].numberAudince+=tempSchedule.schedule[i].info[k].room
                        var j = 0
                        while  (j<tempSchedule.schedule[i].info.count-1) {
                            if ((tempSchedule.schedule[i].info[j].weeks.rangeOfCharacter(from: decimalCharacters)) != nil){
                                let StringRecordedArr = tempSchedule.schedule[i].info[j].weeks.components(separatedBy: ",")
                                monday[idMn].week+=StringRecordedArr.map { Int($0)!}
                                monday[idMn].week.sort()
                            }else if (tempSchedule.schedule[i].info[k].weeks=="even"){
                                monday[idMn].isEven=true
                            }else if (tempSchedule.schedule[i].info[k].weeks=="odd"){                                    monday[idMn].isOdd=true
                            }
                            j+=1
                        }
                        idMn+=1
                        break
                    }
                    k+=1
                }
                
            case 2:
                var k=0
                while (k != tempSchedule.schedule[i].info.count-1){
                    if tempSchedule.schedule[i].info[k].name != ""{
                        tuesday.append(.init())
                        tuesday[idTd].timeStart+=tempSchedule.schedule[i].interval.startTime
                        tuesday[idTd].timeEnd+=tempSchedule.schedule[i].interval.endTime
                        tuesday[idTd].nameLesson+=tempSchedule.schedule[i].info[k].name
                        tuesday[idTd].typeLesson+=tempSchedule.schedule[i].info[k].type
                        tuesday[idTd].nameTeacher+=tempSchedule.schedule[i].info[k].professor
                        tuesday[idTd].numberAudince+=tempSchedule.schedule[i].info[k].room

                        var j = 0
                        while  (j<tempSchedule.schedule[i].info.count-1) {
                            if ((tempSchedule.schedule[i].info[j].weeks.rangeOfCharacter(from: decimalCharacters)) != nil){
                                let StringRecordedArr = tempSchedule.schedule[i].info[j].weeks.components(separatedBy: ",")
                                tuesday[idTd].week+=StringRecordedArr.map { Int($0)!}
                                tuesday[idTd].week.sort()
                            }else if (tempSchedule.schedule[i].info[k].weeks=="even"){
                                tuesday[idTd].isEven=true
                            }else if (tempSchedule.schedule[i].info[k].weeks=="odd"){                                   tuesday[idTd].isOdd=true
                            }
                            j+=1
                        }
                        idTd+=1

                        break
                    }
                    k+=1
                }
            case 3:
                var k=0
                while (k != tempSchedule.schedule[i].info.count-1){
                    if tempSchedule.schedule[i].info[k].name != ""{
                        wednesday.append(.init())
                        wednesday[idWd].timeStart+=tempSchedule.schedule[i].interval.startTime
                        wednesday[idWd].timeEnd+=tempSchedule.schedule[i].interval.endTime
                        wednesday[idWd].nameLesson+=tempSchedule.schedule[i].info[k].name
                        wednesday[idWd].typeLesson+=tempSchedule.schedule[i].info[k].type
                        wednesday[idWd].nameTeacher+=tempSchedule.schedule[i].info[k].professor
                        wednesday[idWd].numberAudince+=tempSchedule.schedule[i].info[k].room

                        var j = 0
                        while  (j<tempSchedule.schedule[i].info.count-1) {
                            if ((tempSchedule.schedule[i].info[j].weeks.rangeOfCharacter(from: decimalCharacters)) != nil){
                                let StringRecordedArr = tempSchedule.schedule[i].info[j].weeks.components(separatedBy: ",")
                                wednesday[idWd].week+=StringRecordedArr.map { Int($0)!}
                                wednesday[idWd].week.sort()
                            }else if (tempSchedule.schedule[i].info[k].weeks=="even"){
                                wednesday[idWd].isEven=true
                            }else if (tempSchedule.schedule[i].info[k].weeks=="odd"){                                     wednesday[idWd].isOdd=true
                            }
                            j+=1
                            
                        }
                        idWd+=1
                        break
                    }
                    k+=1
                }
            case 4:
                var k=0
                while (k != tempSchedule.schedule[i].info.count-1){
                    if tempSchedule.schedule[i].info[k].name != ""{
                        thursday.append(.init())
                        thursday[idTh].timeStart+=tempSchedule.schedule[i].interval.startTime
                        thursday[idTh].timeEnd+=tempSchedule.schedule[i].interval.endTime
                        thursday[idTh].nameLesson+=tempSchedule.schedule[i].info[k].name
                        thursday[idTh].typeLesson+=tempSchedule.schedule[i].info[k].type
                        thursday[idTh].nameTeacher+=tempSchedule.schedule[i].info[k].professor
                        thursday[idTh].numberAudince+=tempSchedule.schedule[i].info[k].room
                        var j = 0
                        while  (j<tempSchedule.schedule[i].info.count-1) {
                            if ((tempSchedule.schedule[i].info[j].weeks.rangeOfCharacter(from: decimalCharacters)) != nil){
                                let StringRecordedArr = tempSchedule.schedule[i].info[j].weeks.components(separatedBy: ",")
                                thursday[idTh].week+=StringRecordedArr.map { Int($0)!}
                                thursday[idTh].week.sort()
                            }else if (tempSchedule.schedule[i].info[k].weeks=="even"){
                                thursday[idTh].isEven=true
                            }else if (tempSchedule.schedule[i].info[k].weeks=="odd"){                                     thursday[idTh].isOdd=true
                            }
                            j+=1
                            
                        }
                        idTh+=1
                        break
                    }
                    k+=1
                }
                
            case 5:
                var k=0
                var id=0
                while (k != tempSchedule.schedule[i].info.count-1){
                    if tempSchedule.schedule[i].info[k].name != ""{
                        friday.append(.init())
                        friday[idFd].timeStart+=tempSchedule.schedule[i].interval.startTime
                        friday[idFd].timeEnd+=tempSchedule.schedule[i].interval.endTime
                        friday[idFd].nameLesson+=tempSchedule.schedule[i].info[k].name
                        friday[idFd].typeLesson+=tempSchedule.schedule[i].info[k].type
                        friday[idFd].nameTeacher+=tempSchedule.schedule[i].info[k].professor
                        friday[idFd].numberAudince+=tempSchedule.schedule[i].info[k].room
                        var j = 0
                        while  (j<tempSchedule.schedule[i].info.count-1) {
                            if ((tempSchedule.schedule[i].info[j].weeks.rangeOfCharacter(from: decimalCharacters)) != nil){
                                let StringRecordedArr = tempSchedule.schedule[i].info[j].weeks.components(separatedBy: ",")
                                friday[id].week+=StringRecordedArr.map { Int($0)!}
                                friday[id].week.sort()
                            }else if (tempSchedule.schedule[i].info[k].weeks=="even"){
                                friday[idFd].isEven=true
                            }else if (tempSchedule.schedule[i].info[k].weeks=="odd"){                                     friday[idFd].isOdd=true
                            }
                            j+=1
                            
                        }
                        idFd+=1
                        break
                    }
                    k+=1
                    
                }
            case 6:
                var k=0
                while (k != tempSchedule.schedule[i].info.count-1){
                    if tempSchedule.schedule[i].info[k].name != ""{
                        saturday.append(.init())
                        saturday[idSt].timeStart+=tempSchedule.schedule[i].interval.startTime
                        saturday[idSt].timeEnd+=tempSchedule.schedule[i].interval.endTime
                        saturday[idSt].nameLesson+=tempSchedule.schedule[i].info[k].name
                        saturday[idSt].typeLesson+=tempSchedule.schedule[i].info[k].type
                        saturday[idSt].nameTeacher+=tempSchedule.schedule[i].info[k].professor
                        saturday[idSt].numberAudince+=tempSchedule.schedule[i].info[k].room
                        var j = 0
                        while  (j<tempSchedule.schedule[i].info.count-1) {
                            if ((tempSchedule.schedule[i].info[j].weeks.rangeOfCharacter(from: decimalCharacters)) != nil){
                                let StringRecordedArr = tempSchedule.schedule[i].info[j].weeks.components(separatedBy: ",")
                                saturday[idSt].week+=StringRecordedArr.map { Int($0)!}
                                saturday[idSt].week.sort()
                            }else if (tempSchedule.schedule[i].info[k].weeks=="even"){
                                saturday[idSt].isEven=true
                            }else if (tempSchedule.schedule[i].info[k].weeks=="odd"){                                     saturday[idSt].isOdd=true
                            }
                            j+=1
                            
                        }
                        idSt+=1
                        break
                    }
                    k+=1
                }
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
    var isOdd:Bool
    var isEven:Bool
    var week: Array<Int>
    init() {
        timeStart=""
        timeEnd=""
        isOdd=false
        isEven=false
        typeLesson=""
        nameLesson=""
        numberAudince=""
        nameTeacher=""
        week=[]
    }
    
}

