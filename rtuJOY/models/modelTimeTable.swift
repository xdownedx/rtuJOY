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
                        monday[idMn].nameTeacher+=tempSchedule.schedule[i].info[k].professor
                        monday[idMn].numberAudince+=tempSchedule.schedule[i].info[k].room
                        switch tempSchedule.schedule[i].info[k].type {
                        case "пр":
                            monday[idMn].typeLesson+="семинар"
                        case "лк":
                            monday[idMn].typeLesson+="лекция"
                        case "лаб":
                            monday[idMn].typeLesson+="лабораторная работа"
                        case "экз":
                            monday[idMn].typeLesson+="Экзамен"
                        case "зач":
                            monday[idMn].typeLesson+="Зачет"
                            
                        default:
                            monday[idMn].typeLesson+="занятие"
                        }
                        var j = 0
                        while  (j<tempSchedule.schedule[i].info.count-1) {
                            if ((tempSchedule.schedule[i].info[j].weeks.rangeOfCharacter(from: decimalCharacters)) != nil){
                                let StringRecordedArr = tempSchedule.schedule[i].info[j].weeks.components(separatedBy: ",")
                                monday[idMn].week+=StringRecordedArr.map { Int($0)!}
                                monday[idMn].week.sort()
                            }else{
                                if (tempSchedule.schedule[i].info[k].weeks=="even"){
                                    monday[idMn].week+=[2,4,6,8,10,12,14,16]
                            }
                                if (tempSchedule.schedule[i].info[k].weeks=="odd"){
                                    monday[idMn].week+=[1,3,5,7,9,11,13,15]
                                }
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
                        tuesday[idTd].nameTeacher+=tempSchedule.schedule[i].info[k].professor
                        tuesday[idTd].numberAudince+=tempSchedule.schedule[i].info[k].room
                        switch tempSchedule.schedule[i].info[k].type {
                        case "пр":
                            tuesday[idTd].typeLesson+="семинар"
                        case "лк":
                            tuesday[idTd].typeLesson+="лекция"
                        case "лаб":
                            tuesday[idTd].typeLesson+="лабораторная работа"
                        case "экз":
                            tuesday[idTd].typeLesson+="Экзамен"
                        case "зач":
                            tuesday[idTd].typeLesson+="Зачет"
                            
                        default:
                            tuesday[idTd].typeLesson+="занятие"
                        }
                        
                        var j = 0
                        while  (j<tempSchedule.schedule[i].info.count-1) {
                            if ((tempSchedule.schedule[i].info[j].weeks.rangeOfCharacter(from: decimalCharacters)) != nil){
                                let StringRecordedArr = tempSchedule.schedule[i].info[j].weeks.components(separatedBy: ",")
                                tuesday[idTd].week+=StringRecordedArr.map { Int($0)!}
                                tuesday[idTd].week.sort()
                            }else{
                                if (tempSchedule.schedule[i].info[k].weeks=="even"){
                                    tuesday[idTd].week+=[2,4,6,8,10,12,14,16]
                            }
                                if (tempSchedule.schedule[i].info[k].weeks=="odd"){
                                    tuesday[idTd].week+=[1,3,5,7,9,11,13,15]
                                }
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
                        wednesday[idWd].nameTeacher+=tempSchedule.schedule[i].info[k].professor
                        wednesday[idWd].numberAudince+=tempSchedule.schedule[i].info[k].room
                        switch tempSchedule.schedule[i].info[k].type {
                        case "пр":
                            wednesday[idWd].typeLesson+="семинар"
                        case "лк":
                            wednesday[idWd].typeLesson+="лекция"
                        case "лаб":
                            wednesday[idWd].typeLesson+="лабораторная работа"
                        case "экз":
                            wednesday[idWd].typeLesson+="Экзамен"
                        case "зач":
                            wednesday[idWd].typeLesson+="Зачет"
                            
                        default:
                            wednesday[idWd].typeLesson+="занятие"
                        }
                        
                        var j = 0
                        while  (j<tempSchedule.schedule[i].info.count-1) {
                            if ((tempSchedule.schedule[i].info[j].weeks.rangeOfCharacter(from: decimalCharacters)) != nil){
                                let StringRecordedArr = tempSchedule.schedule[i].info[j].weeks.components(separatedBy: ",")
                                wednesday[idWd].week+=StringRecordedArr.map { Int($0)!}
                                wednesday[idWd].week.sort()
                            }else{
                                if (tempSchedule.schedule[i].info[k].weeks=="even"){
                                    wednesday[idWd].week+=[2,4,6,8,10,12,14,16]
                            }
                                if (tempSchedule.schedule[i].info[k].weeks=="odd"){
                                    wednesday[idWd].week+=[1,3,5,7,9,11,13,15]
                                }
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
                        thursday[idTh].nameTeacher+=tempSchedule.schedule[i].info[k].professor
                        thursday[idTh].numberAudince+=tempSchedule.schedule[i].info[k].room
                        switch tempSchedule.schedule[i].info[k].type {
                        case "пр":
                            thursday[idTh].typeLesson+="семинар"
                        case "лк":
                            thursday[idTh].typeLesson+="лекция"
                        case "лаб":
                            thursday[idTh].typeLesson+="лабораторная работа"
                        case "экз":
                            thursday[idTh].typeLesson+="Экзамен"
                        case "зач":
                            thursday[idTh].typeLesson+="Зачет"
                            
                        default:
                            thursday[idTh].typeLesson+="занятие"
                        }
                        var j = 0
                        while  (j<tempSchedule.schedule[i].info.count-1) {
                            if ((tempSchedule.schedule[i].info[j].weeks.rangeOfCharacter(from: decimalCharacters)) != nil){
                                let StringRecordedArr = tempSchedule.schedule[i].info[j].weeks.components(separatedBy: ",")
                                thursday[idTh].week+=StringRecordedArr.map { Int($0)!}
                                thursday[idTh].week.sort()
                            }else{
                                if (tempSchedule.schedule[i].info[k].weeks=="even"){
                                    thursday[idTh].week+=[2,4,6,8,10,12,14,16]
                            }
                                if (tempSchedule.schedule[i].info[k].weeks=="odd"){
                                    thursday[idTh].week+=[1,3,5,7,9,11,13,15]
                                }
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
                while (k != tempSchedule.schedule[i].info.count-1){
                    if tempSchedule.schedule[i].info[k].name != ""{
                        friday.append(.init())
                        friday[idFd].timeStart+=tempSchedule.schedule[i].interval.startTime
                        friday[idFd].timeEnd+=tempSchedule.schedule[i].interval.endTime
                        friday[idFd].nameLesson+=tempSchedule.schedule[i].info[k].name
                        friday[idFd].nameTeacher+=tempSchedule.schedule[i].info[k].professor
                        friday[idFd].numberAudince+=tempSchedule.schedule[i].info[k].room
                        switch tempSchedule.schedule[i].info[k].type {
                        case "пр":
                            friday[idFd].typeLesson+="семинар"
                        case "лк":
                            friday[idFd].typeLesson+="лекция"
                        case "лаб":
                            friday[idFd].typeLesson+="лабораторная работа"
                        case "экз":
                            friday[idFd].typeLesson+="Экзамен"
                        case "зач":
                            friday[idFd].typeLesson+="Зачет"
                            
                        default:
                            friday[idFd].typeLesson+="занятие"
                        }
                        var j = 0
                        while  (j<tempSchedule.schedule[i].info.count-1) {
                            if ((tempSchedule.schedule[i].info[j].weeks.rangeOfCharacter(from: decimalCharacters)) != nil){
                                let StringRecordedArr = tempSchedule.schedule[i].info[j].weeks.components(separatedBy: ",")
                                friday[idFd].week+=StringRecordedArr.map { Int($0)!}
                                friday[idFd].week.sort()
                            }else{
                                if (tempSchedule.schedule[i].info[k].weeks=="even"){
                                    friday[idFd].week+=[2,4,6,8,10,12,14,16]
                            }
                                if (tempSchedule.schedule[i].info[k].weeks=="odd"){
                                    friday[idFd].week+=[1,3,5,7,9,11,13,15]
                                }
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
                        saturday[idSt].nameTeacher+=tempSchedule.schedule[i].info[k].professor
                        saturday[idSt].numberAudince+=tempSchedule.schedule[i].info[k].room
                        switch tempSchedule.schedule[i].info[k].type {
                        case "пр":
                            saturday[idSt].typeLesson+="семинар"
                        case "лк":
                            saturday[idSt].typeLesson+="лекция"
                        case "лаб":
                            saturday[idSt].typeLesson+="лабораторная работа"
                        case "экз":
                            saturday[idSt].typeLesson+="Экзамен"
                        case "зач":
                            saturday[idSt].typeLesson+="Зачет"
                            
                        default:
                            saturday[idSt].typeLesson+="занятие"
                        }
                        var j = 0
                        while  (j<tempSchedule.schedule[i].info.count-1) {
                            if ((tempSchedule.schedule[i].info[j].weeks.rangeOfCharacter(from: decimalCharacters)) != nil){
                                let StringRecordedArr = tempSchedule.schedule[i].info[j].weeks.components(separatedBy: ",")
                                saturday[idSt].week+=StringRecordedArr.map { Int($0)!}
                                saturday[idSt].week.sort()
                            }else{
                                if (tempSchedule.schedule[i].info[k].weeks=="even"){
                                    saturday[idSt].week+=[2,4,6,8,10,12,14,16]
                            }
                                if (tempSchedule.schedule[i].info[k].weeks=="odd"){
                                    saturday[idSt].week+=[1,3,5,7,9,11,13,15]
                                }
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
    //    init(){
    //        monday = []
    //        tuesday = []
    //        wednesday = []
    //        thursday = []
    //        friday = []
    //        saturday = []
    //    }
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

