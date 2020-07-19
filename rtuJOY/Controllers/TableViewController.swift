//
//  TableViewController.swift
//  rtuJOY
//
//  Created by Максим Палёхин on 09.07.2020.
//  Copyright © 2020 Максим Палёхин. All rights reserved.
//

import UIKit

let week = 2
var group="ktso-01-19"

class TableViewController: UITableViewController {
    var parsingData = ParsingData()
    var arrForConclusion:Array<Array<task>> = []
    var cell = CustomCell()
    
    
    var arrForCell:Array<Array<Int>> = []
    override func viewDidLoad() {
        group="ktso-01-19"
        arrForConclusion.append(Array<task>())
        arrForConclusion[0].append(.init())
        arrForConclusion[0][0].nameLesson="test"
        arrForConclusion[0][0].nameTeacher="test"
        arrForConclusion[0][0].numberAudince="test"
        arrForConclusion[0][0].timeEnd="test"
        arrForConclusion[0][0].timeStart="test"
        arrForConclusion[0][0].typeLesson="test"
        
        self.parsingData.onCompletion = {scheduleForWeek in
            self.schedeleForConclusion(schudele:scheduleForWeek)
        }
        
        self.parsingData.broadcastData(group: group)
        super.viewDidLoad()
        self.tableView.register(UINib(nibName: String(describing: CustomCell.self), bundle: nil),forCellReuseIdentifier:String(describing: CustomCell.self))
        
    }
    
    
    // Получим количество секций в таблице
    override func numberOfSections(in tableView: UITableView) -> Int {
        var o=0
        while o<arrForConclusion.count{
            if arrForConclusion[o].isEmpty{arrForConclusion.remove(at: o)}
            o+=1
        }
        return arrForConclusion.count
    }
    
    //получим количество ячеек в секции
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard arrForConclusion.isEmpty==false else {
            return 0
        }
        return arrForConclusion[section].count
    }
    
    // Получим заголовок для секции
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard weekday>1 else {
            switch section {
            case 0:
                return "\(days[weekday-1]), \(currentData(day: curDayInMonth+1, month: curMonth))"
            case 1:
                return "\(days[weekday]), \(currentData(day: curDayInMonth+2, month: curMonth))"
            default:
                return "error"
            }
            
        }
        guard weekday<6 else{
            
            switch weekday {
            case 6:
                switch section {
                case 0:
                    return "\(days[weekday-2]), \(currentData(day: curDayInMonth, month: curMonth))"
                case 1:
                    return "\(days[weekday-1]), \(currentData(day: curDayInMonth+1, month: curMonth))"
                default:
                    return "error"
                }
            case 7:
                switch section {
                case 0:
                    return "\(days[weekday-2]), \(currentData(day: curDayInMonth, month: curMonth))"
                case 1:
                    return "\(days[0]), \(currentData(day: curDayInMonth+2, month: curMonth))"
                default:
                    return "error"
                }
            default:
                return "error"
            }
        }
        
        
        switch section {
        case 0:
            return "\(days[weekday-2]), \(currentData(day: curDayInMonth, month: curMonth))"
        case 1:
            return "\(days[weekday-1]), \(currentData(day: curDayInMonth+1, month: curMonth))"
        case 2:
            return "\(days[weekday]), \(currentData(day: curDayInMonth+2, month: curMonth))"
        default:
            return "error"
        }
        
    }
    
    //Заполнение ячеек
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! CustomCell

        cell.timeStart?.text = arrForConclusion[indexPath.section][indexPath.row].timeStart
        cell.nameLesson?.text = arrForConclusion[indexPath.section][indexPath.row].nameLesson
        cell.timeEnd?.text = arrForConclusion[indexPath.section][indexPath.row].timeEnd
        cell.typeLesson?.text = arrForConclusion[indexPath.section][indexPath.row].typeLesson
        cell.numberAudince?.text = "Ауд." + arrForConclusion[indexPath.section][indexPath.row].numberAudince
        cell.nameTeacher?.text = arrForConclusion[indexPath.section][indexPath.row].nameTeacher
        return cell
        
    }
    
    
    
    func schedeleForConclusion(schudele:schedulePerWeek){
        arrForConclusion=[]
        arrForCell=[]
        switch calendar.component(.weekday, from: date) {
        case 1:
            var i=0
            var id=0
            arrForConclusion.append(Array<task>())
            while(i<schudele.monday.count-1){
                if(schudele.monday[i].week.contains(week)){
                    arrForConclusion[0].append(.init())
                    arrForConclusion[0][id]=schudele.monday[i]
                    id+=1
                } else if(schudele.monday[i].week.isEmpty)&&(schudele.monday[i].isOdd)&&(week%2==1){
                    arrForConclusion[0].append(.init())
                    arrForConclusion[0][id]=schudele.monday[i]
                    id+=1
                } else if (schudele.monday[i].week.isEmpty)&&(schudele.monday[i].isEven)&&(week%2==0){
                    arrForConclusion[0].append(.init())
                    arrForConclusion[0][id]=schudele.monday[i]
                    id+=1
                }
                i+=1
            }
            
            i=0
            id=0
            
            arrForConclusion.append(Array<task>())
            while(i<schudele.tuesday.count-1){
                
                if(schudele.tuesday[i].week.contains(week)){
                    arrForConclusion[1].append(.init())
                    arrForConclusion[1][id]=schudele.tuesday[i]
                    id+=1
                } else if(schudele.tuesday[i].week.isEmpty)&&(schudele.monday[i].isOdd)&&(week%2==1){
                    arrForConclusion[1].append(.init())
                    arrForConclusion[1][id]=schudele.tuesday[i]
                    id+=1
                } else if (schudele.tuesday[i].week.isEmpty)&&(schudele.monday[i].isEven)&&(week%2==0){
                    arrForConclusion[1].append(.init())
                    arrForConclusion[1][id]=schudele.tuesday[i]
                    id+=1
                }
                i+=1
            }
        case 2:
            var i=0
            var id=0
            arrForConclusion.append(Array<task>())
            while(i<schudele.monday.count-1){
                
                if(schudele.monday[i].week.contains(week)){
                    arrForConclusion[0].append(.init())
                    arrForConclusion[0][id]=schudele.monday[i]
                    id+=1
                } else if(schudele.monday[i].week.isEmpty)&&(schudele.monday[i].isOdd)&&(week%2==1){
                    arrForConclusion[0].append(.init())
                    arrForConclusion[0][id]=schudele.monday[i]
                    id+=1
                } else if (schudele.monday[i].week.isEmpty)&&(schudele.monday[i].isEven)&&(week%2==0){
                    arrForConclusion[0].append(.init())
                    arrForConclusion[0][id]=schudele.monday[i]
                    id+=1
                }
                i+=1
            }
            
            i=0
            id=0
            
            arrForConclusion.append(Array<task>())
            while(i<schudele.tuesday.count-1){
                
                
                if(schudele.tuesday[i].week.contains(week)){
                    arrForConclusion[1].append(.init())
                    arrForConclusion[1][id]=schudele.tuesday[i]
                    id+=1
                } else if(schudele.tuesday[i].week.isEmpty)&&(schudele.tuesday[i].isOdd)&&(week%2==1){
                    arrForConclusion[1].append(.init())
                    arrForConclusion[1][id]=schudele.tuesday[i]
                    id+=1
                } else if (schudele.tuesday[i].week.isEmpty)&&(schudele.tuesday[i].isEven)&&(week%2==0){
                    arrForConclusion[1].append(.init())
                    arrForConclusion[1][id]=schudele.tuesday[i]
                    id+=1
                }
                i+=1
            }
            
            i=0
            
            arrForConclusion.append(Array<task>())
            while(i<schudele.thursday.count-1){
                
                if(schudele.thursday[i].week.contains(week)){
                    arrForConclusion[2].append(.init())
                    arrForConclusion[2][id]=schudele.thursday[i]
                    id+=1
                } else if(schudele.thursday[i].week.isEmpty)&&(schudele.thursday[i].isOdd)&&(week%2==1){
                    arrForConclusion[2].append(.init())
                    arrForConclusion[2][id]=schudele.thursday[i]
                    id+=1
                } else if (schudele.thursday[i].week.isEmpty)&&(schudele.thursday[i].isEven)&&(week%2==0){
                    arrForConclusion[2].append(.init())
                    arrForConclusion[2][id]=schudele.thursday[i]
                    id+=1
                }
                i+=1
            }
        case 3:
            var i=0
            var id=0
            
            arrForConclusion.append(Array<task>())
            while(i<schudele.tuesday.count-1){
                
                if(schudele.tuesday[i].week.contains(week)){
                    arrForConclusion[0].append(.init())
                    arrForConclusion[0][id]=schudele.tuesday[i]
                    id+=1
                } else if(schudele.tuesday[i].week.isEmpty)&&(schudele.tuesday[i].isOdd)&&(week%2==1){
                    arrForConclusion[0].append(.init())
                    arrForConclusion[0][id]=schudele.tuesday[i]
                    id+=1
                } else if (schudele.tuesday[i].week.isEmpty)&&(schudele.tuesday[i].isEven)&&(week%2==0){
                    arrForConclusion[0].append(.init())
                    arrForConclusion[0][id]=schudele.tuesday[i]
                    id+=1
                }
                i+=1
            }
            
            i=0
            
            arrForConclusion.append(Array<task>())
            while(i<schudele.thursday.count-1){
                
                
                if(schudele.thursday[i].week.contains(week)){
                    arrForConclusion[1].append(.init())
                    arrForConclusion[1][id]=schudele.thursday[i]
                    id+=1
                } else if(schudele.thursday[i].week.isEmpty)&&(schudele.thursday[i].isOdd)&&(week%2==1){
                    arrForConclusion[1].append(.init())
                    arrForConclusion[1][id]=schudele.thursday[i]
                    id+=1
                } else if (schudele.thursday[i].week.isEmpty)&&(schudele.thursday[i].isEven)&&(week%2==0){
                    arrForConclusion[1].append(.init())
                    arrForConclusion[1][id]=schudele.thursday[i]
                    id+=1
                }
                i+=1
            }
            
            i=0
            arrForConclusion.append(Array<task>())
            while(i<schudele.wednesday.count-1){
                
                
                if(schudele.wednesday[i].week.contains(week)){
                    arrForConclusion[2].append(.init())
                    arrForConclusion[2][id]=schudele.wednesday[i]
                    id+=1
                } else if(schudele.wednesday[i].week.isEmpty)&&(schudele.wednesday[i].isOdd)&&(week%2==1){
                    arrForConclusion[2].append(.init())
                    arrForConclusion[2][id]=schudele.wednesday[i]
                    id+=1
                } else if (schudele.wednesday[i].week.isEmpty)&&(schudele.wednesday[i].isEven)&&(week%2==0){
                    arrForConclusion[2].append(.init())
                    arrForConclusion[2][id]=schudele.wednesday[i]
                    id+=1
                }
                i+=1
            }
        case 4:
            var i=0
            var id=0
            
            arrForConclusion.append(Array<task>())
            while(i<schudele.thursday.count-1){
                
                
                if(schudele.thursday[i].week.contains(week)){
                    arrForConclusion[0].append(.init())
                    arrForConclusion[0][id]=schudele.thursday[i]
                    id+=1
                } else if(schudele.thursday[i].week.isEmpty)&&(schudele.thursday[i].isOdd)&&(week%2==1){
                    arrForConclusion[0].append(.init())
                    arrForConclusion[0][id]=schudele.thursday[i]
                    id+=1
                } else if (schudele.thursday[i].week.isEmpty)&&(schudele.thursday[i].isEven)&&(week%2==0){
                    arrForConclusion[0].append(.init())
                    arrForConclusion[0][id]=schudele.thursday[i]
                    id+=1
                }
                i+=1
            }
            
            i=0
            
            arrForConclusion.append(Array<task>())
            while(i<schudele.wednesday.count-1){
                
                if(schudele.wednesday[i].week.contains(week)){
                    arrForConclusion[1].append(.init())
                    arrForConclusion[1][id]=schudele.wednesday[i]
                    id+=1
                } else if(schudele.wednesday[i].week.isEmpty)&&(schudele.wednesday[i].isOdd)&&(week%2==1){
                    arrForConclusion[1].append(.init())
                    arrForConclusion[1][id]=schudele.wednesday[i]
                    id+=1
                } else if (schudele.wednesday[i].week.isEmpty)&&(schudele.wednesday[i].isEven)&&(week%2==0){
                    arrForConclusion[1].append(.init())
                    arrForConclusion[1][id]=schudele.wednesday[i]
                    id+=1
                }
                i+=1
            }
            
            i=0
            arrForConclusion.append(Array<task>())
            while(i<schudele.friday.count-1){
                
                
                if(schudele.friday[i].week.contains(week)){
                    arrForConclusion.append(.init())
                    arrForConclusion[2][id]=schudele.friday[i]
                    id+=1
                } else if(schudele.friday[i].week.isEmpty)&&(schudele.friday[i].isOdd)&&(week%2==1){
                    arrForConclusion.append(.init())
                    arrForConclusion[2][id]=schudele.friday[i]
                    id+=1
                } else if (schudele.friday[i].week.isEmpty)&&(schudele.friday[i].isEven)&&(week%2==0){
                    arrForConclusion.append(.init())
                    arrForConclusion[2][id]=schudele.friday[i]
                    id+=1
                }
                i+=1
            }
        case 5:
            var i=0
            var id=0
            arrForConclusion.append(Array<task>())
            while(i<schudele.wednesday.count-1){
                
                
                if(schudele.wednesday[i].week.contains(week)){
                    arrForConclusion[0].append(.init())
                    arrForConclusion[0][id]=schudele.wednesday[i]
                    id+=1
                } else if(schudele.wednesday[i].week.isEmpty)&&(schudele.wednesday[i].isOdd)&&(week%2==1){
                    arrForConclusion[0].append(.init())
                    arrForConclusion[0][id]=schudele.wednesday[i]
                    id+=1
                } else if (schudele.wednesday[i].week.isEmpty)&&(schudele.wednesday[i].isEven)&&(week%2==0){
                    arrForConclusion[0].append(.init())
                    arrForConclusion[0][id]=schudele.wednesday[i]
                    id+=1
                }
                i+=1
            }
            
            i=0
            arrForConclusion.append(Array<task>())
            while(i<schudele.friday.count-1){
                
                
                if(schudele.friday[i].week.contains(week)){
                    arrForConclusion.append(.init())
                    arrForConclusion[1][id]=schudele.friday[i]
                    id+=1
                } else if(schudele.friday[i].week.isEmpty)&&(schudele.friday[i].isOdd)&&(week%2==1){
                    arrForConclusion.append(.init())
                    arrForConclusion[1][id]=schudele.friday[i]
                    id+=1
                } else if (schudele.friday[i].week.isEmpty)&&(schudele.friday[i].isEven)&&(week%2==0){
                    arrForConclusion.append(.init())
                    arrForConclusion[1][id]=schudele.friday[i]
                    id+=1
                }
                i+=1
            }
            
            i=0
            
            arrForConclusion.append(Array<task>())
            while(i<schudele.saturday.count-1){
                if(schudele.saturday[i].week.contains(week)){
                    arrForConclusion[2].append(.init())
                    arrForConclusion[2][id]=schudele.saturday[i]
                    id+=1
                } else if(schudele.saturday[i].week.isEmpty)&&(schudele.saturday[i].isOdd)&&(week%2==1){
                    arrForConclusion[2].append(.init())
                    arrForConclusion[2][id]=schudele.saturday[i]
                    id+=1
                } else if (schudele.saturday[i].week.isEmpty)&&(schudele.saturday[i].isEven)&&(week%2==0){
                    arrForConclusion[2].append(.init())
                    arrForConclusion[2][id]=schudele.saturday[i]
                    id+=1
                }
                i+=1
            }
        case 6:
            var i=0
            var id=0
            
            arrForConclusion.append(Array<task>())
            while(i<schudele.friday.count-1){
                
                if(schudele.friday[i].week.contains(week)){
                    arrForConclusion.append(.init())
                    arrForConclusion[0][id]=schudele.friday[i]
                    id+=1
                } else if(schudele.friday[i].week.isEmpty)&&(schudele.friday[i].isOdd)&&(week%2==1){
                    arrForConclusion.append(.init())
                    arrForConclusion[0][id]=schudele.friday[i]
                    id+=1
                } else if (schudele.friday[i].week.isEmpty)&&(schudele.friday[i].isEven)&&(week%2==0){
                    arrForConclusion.append(.init())
                    arrForConclusion[0][id]=schudele.friday[i]
                    id+=1
                }
                i+=1
            }
            
            i=0
            
            arrForConclusion.append(Array<task>())
            while(i<schudele.saturday.count-1){
                if(schudele.saturday[i].week.contains(week)){
                    arrForConclusion[1].append(.init())
                    arrForConclusion[1][id]=schudele.saturday[i]
                    id+=1
                } else if(schudele.saturday[i].week.isEmpty)&&(schudele.saturday[i].isOdd)&&(week%2==1){
                    arrForConclusion[1].append(.init())
                    arrForConclusion[1][id]=schudele.saturday[i]
                    id+=1
                } else if (schudele.saturday[i].week.isEmpty)&&(schudele.saturday[i].isEven)&&(week%2==0){
                    arrForConclusion[1].append(.init())
                    arrForConclusion[1][id]=schudele.saturday[i]
                    id+=1
                }
                i+=1
            }
        case 7:
            var i=0
            var id=0
            
            arrForConclusion.append(Array<task>())
            while(i<schudele.saturday.count-1){
                
                
                if(schudele.saturday[i].week.contains(week)){
                    arrForConclusion[0].append(.init())
                    arrForConclusion[0][id]=schudele.saturday[i]
                    id+=1
                } else if(schudele.saturday[i].week.isEmpty)&&(schudele.saturday[i].isOdd)&&(week%2==1){
                    arrForConclusion[0].append(.init())
                    arrForConclusion[0][id]=schudele.saturday[i]
                } else if (schudele.saturday[i].week.isEmpty)&&(schudele.saturday[i].isEven)&&(week%2==0){
                    arrForConclusion[0].append(.init())
                    arrForConclusion[0][id]=schudele.saturday[i]
                    i+=1
                }
                i=0
                
                arrForConclusion.append(Array<task>())
                while(i<schudele.monday.count-1){
                    
                    
                    if(schudele.monday[i].week.contains(week)){
                        arrForConclusion[1].append(.init())
                        arrForConclusion[1][id]=schudele.monday[i]
                        id+=1
                    } else if(schudele.monday[i].week.isEmpty)&&(schudele.monday[i].isOdd)&&(week%2==1){
                        arrForConclusion[1].append(.init())
                        arrForConclusion[1][id]=schudele.monday[i]
                        id+=1
                    } else if (schudele.monday[i].week.isEmpty)&&(schudele.monday[i].isEven)&&(week%2==0){
                        arrForConclusion[1].append(.init())
                        arrForConclusion[1][id]=schudele.monday[i]
                        id+=1
                    }
                    i+=1
                }
            }
        default:
            return
        }
        print(arrForConclusion)
        DispatchQueue.main.async(execute: {
            self.tableView.reloadData()
        })
        
    }
}

