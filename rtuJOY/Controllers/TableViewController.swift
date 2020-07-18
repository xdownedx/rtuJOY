//
//  TableViewController.swift
//  rtuJOY
//
//  Created by Максим Палёхин on 09.07.2020.
//  Copyright © 2020 Максим Палёхин. All rights reserved.
//

import UIKit

let week = 1
var iJil=0
class TableViewController: UITableViewController {
    
    var parsingData = ParsingData()
    var arrForConclusion:Array<Array<task>> = []
    
    
    
    
    // Получим количество секций в таблице
    override func numberOfSections(in tableView: UITableView) -> Int {
        guard (weekday>1)&&(weekday<6) else{
            return 2}
        return 3
    }
    
    //получим количество ячеек в секции
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrForConclusion.count
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! CustomCell
        
        cell.timeStart?.text = "Говно"
        cell.nameLesson?.text = "говна"
        cell.timeEnd?.text = "10:30"
        cell.typeLesson?.text = "семинар"
        cell.numberAudince?.text = "ауд. А-12"
        cell.nameTeacher?.text = "Пыркин А.Ю."
        return cell
        
    }
    
    
    
     func schedeleForConclusion(schudele:schedulePerWeek){
        guard iJil == 0 else {
            return
        }
        switch calendar.component(.weekday, from: date) {
        case 7:
            var i=0
            var id=0
            while(i<schudele.monday.count-1){
                
                if(schudele.monday[i].week.contains(week)){
                    arrForConclusion.append(Array<task>())
                    arrForConclusion[0].append(.init())
                    arrForConclusion[0][id]=schudele.monday[i]
                    id+=1
                } else if(schudele.monday[i].week.isEmpty)&&(schudele.monday[i].isOdd)&&(week%2==1){
                    arrForConclusion.append(Array<task>())
                    arrForConclusion[0].append(.init())
                    arrForConclusion[0][id]=schudele.monday[i]
                    id+=1
                } else if (schudele.monday[i].week.isEmpty)&&(schudele.monday[i].isEven)&&(week%2==0){
                    arrForConclusion.append(Array<task>())
                    arrForConclusion[0].append(.init())
                    arrForConclusion[0][id]=schudele.monday[i]
                    id+=1
                }
                i+=1
            }
            
            i=0
            id=0
            

            while(i<schudele.tuesday.count-1){
                
                if(schudele.tuesday[i].week.contains(week)){
                    arrForConclusion.append(Array<task>())
                    arrForConclusion[1].append(.init())
                    arrForConclusion[1][id]=schudele.tuesday[i]
                    id+=1
                } else if(schudele.tuesday[i].week.isEmpty)&&(schudele.monday[i].isOdd)&&(week%2==1){
                    arrForConclusion.append(Array<task>())
                    arrForConclusion[1].append(.init())
                    arrForConclusion[1][id]=schudele.tuesday[i]
                    id+=1
                } else if (schudele.tuesday[i].week.isEmpty)&&(schudele.monday[i].isEven)&&(week%2==0){
                    arrForConclusion.append(Array<task>())
                    arrForConclusion[1].append(.init())
                    arrForConclusion[1][id]=schudele.tuesday[i]
                    id+=1
                }
                i+=1
            }
        case 1:
            var i=0
            var id=0
            while(i<schudele.monday.count-1){
                
                if(schudele.monday[i].week.contains(week)){
                    arrForConclusion.append(Array<task>())
                    arrForConclusion[0].append(.init())
                    arrForConclusion[0][id]=schudele.monday[i]
                    id+=1
                } else if(schudele.monday[i].week.isEmpty)&&(schudele.monday[i].isOdd)&&(week%2==1){
                    arrForConclusion.append(Array<task>())
                    arrForConclusion[0].append(.init())
                    arrForConclusion[0][id]=schudele.monday[i]
                    id+=1
                } else if (schudele.monday[i].week.isEmpty)&&(schudele.monday[i].isEven)&&(week%2==0){
                    arrForConclusion.append(Array<task>())
                    arrForConclusion[0].append(.init())
                    arrForConclusion[0][id]=schudele.monday[i]
                    id+=1
                }
                i+=1
            }
            
            i=0
            id=0

            while(i<schudele.tuesday.count-1){
                

                if(schudele.tuesday[i].week.contains(week)){
                    arrForConclusion.append(Array<task>())
                    arrForConclusion[1].append(.init())
                    arrForConclusion[1][id]=schudele.tuesday[i]
                    id+=1
                } else if(schudele.tuesday[i].week.isEmpty)&&(schudele.tuesday[i].isOdd)&&(week%2==1){
                    arrForConclusion.append(Array<task>())
                    arrForConclusion[1].append(.init())
                    arrForConclusion[1][id]=schudele.tuesday[i]
                    id+=1
                } else if (schudele.tuesday[i].week.isEmpty)&&(schudele.tuesday[i].isEven)&&(week%2==0){
                    arrForConclusion.append(Array<task>())
                    arrForConclusion[1].append(.init())
                    arrForConclusion[1][id]=schudele.tuesday[i]
                    id+=1
                }
                i+=1
            }
            
            i=0
            id=0

            while(i<schudele.thursday.count-1){
                
                if(schudele.thursday[i].week.contains(week)){
                    arrForConclusion.append(Array<task>())
                    arrForConclusion[2].append(.init())
                    arrForConclusion[2][id]=schudele.thursday[i]
                    id+=1
                } else if(schudele.thursday[i].week.isEmpty)&&(schudele.thursday[i].isOdd)&&(week%2==1){
                    arrForConclusion.append(Array<task>())
                    arrForConclusion[2].append(.init())
                    arrForConclusion[2][id]=schudele.thursday[i]
                    id+=1
                } else if (schudele.thursday[i].week.isEmpty)&&(schudele.thursday[i].isEven)&&(week%2==0){
                    arrForConclusion.append(Array<task>())
                    arrForConclusion[2].append(.init())
                    arrForConclusion[2][id]=schudele.thursday[i]
                    id+=1
                }
                i+=1
            }
        case 2:
            var i=0
            var id=0
            while(i<schudele.tuesday.count-1){
                arrForConclusion.append(Array<task>())
                arrForConclusion[0].append(.init())
                if(schudele.tuesday[i].week.contains(week)){
                    arrForConclusion[0][id]=schudele.tuesday[i]
                    id+=1
                } else if(schudele.tuesday[i].week.isEmpty)&&(schudele.tuesday[i].isOdd)&&(week%2==1){
                    arrForConclusion[0][id]=schudele.tuesday[i]
                    id+=1
                } else if (schudele.tuesday[i].week.isEmpty)&&(schudele.tuesday[i].isEven)&&(week%2==0){
                    arrForConclusion[0][id]=schudele.tuesday[i]
                    id+=1
                }
                i+=1
            }
            
            i=0
            id=0

            while(i<schudele.thursday.count-1){
                

                if(schudele.thursday[i].week.contains(week)){
                    arrForConclusion.append(Array<task>())
                    arrForConclusion[1].append(.init())
                    arrForConclusion[1][id]=schudele.thursday[i]
                    id+=1
                } else if(schudele.thursday[i].week.isEmpty)&&(schudele.thursday[i].isOdd)&&(week%2==1){
                    
                    arrForConclusion.append(Array<task>())
                    arrForConclusion[1].append(.init())
                    arrForConclusion[1][id]=schudele.thursday[i]
                    id+=1
                } else if (schudele.thursday[i].week.isEmpty)&&(schudele.thursday[i].isEven)&&(week%2==0){
                    arrForConclusion.append(Array<task>())
                    arrForConclusion[1].append(.init())
                    arrForConclusion[1][id]=schudele.thursday[i]
                    id+=1
                }
                i+=1
            }
            
            i=0
            id=0

            while(i<schudele.wednesday.count-1){
                

                if(schudele.wednesday[i].week.contains(week)){
                    arrForConclusion.append(Array<task>())
                    arrForConclusion[2].append(.init())
                    arrForConclusion[2][id]=schudele.wednesday[i]
                    id+=1
                } else if(schudele.wednesday[i].week.isEmpty)&&(schudele.wednesday[i].isOdd)&&(week%2==1){
                    arrForConclusion.append(Array<task>())
                    arrForConclusion[2].append(.init())
                    arrForConclusion[2][id]=schudele.wednesday[i]
                    id+=1
                } else if (schudele.wednesday[i].week.isEmpty)&&(schudele.wednesday[i].isEven)&&(week%2==0){
                    arrForConclusion.append(Array<task>())
                    arrForConclusion[2].append(.init())
                    arrForConclusion[2][id]=schudele.wednesday[i]
                    id+=1
                }
                i+=1
            }
        case 3:
            var i=0
            var id=0
            while(i<schudele.thursday.count-1){
               

                if(schudele.thursday[i].week.contains(week)){
                    arrForConclusion.append(Array<task>())
                                   arrForConclusion[0].append(.init())
                    arrForConclusion[0][id]=schudele.thursday[i]
                    id+=1
                } else if(schudele.thursday[i].week.isEmpty)&&(schudele.thursday[i].isOdd)&&(week%2==1){
                    arrForConclusion.append(Array<task>())
                                   arrForConclusion[0].append(.init())
                    arrForConclusion[0][id]=schudele.thursday[i]
                    id+=1
                } else if (schudele.thursday[i].week.isEmpty)&&(schudele.thursday[i].isEven)&&(week%2==0){
                    arrForConclusion.append(Array<task>())
                                   arrForConclusion[0].append(.init())
                    arrForConclusion[0][id]=schudele.thursday[i]
                    id+=1
                }
                i+=1
            }
            
            i=0
            id=0

            while(i<schudele.wednesday.count-1){
               
                if(schudele.wednesday[i].week.contains(week)){
                    arrForConclusion.append(Array<task>())
                                   arrForConclusion[1].append(.init())

                    arrForConclusion[1][id]=schudele.wednesday[i]
                    id+=1
                } else if(schudele.wednesday[i].week.isEmpty)&&(schudele.wednesday[i].isOdd)&&(week%2==1){
                    arrForConclusion.append(Array<task>())
                                   arrForConclusion[1].append(.init())

                    arrForConclusion[1][id]=schudele.wednesday[i]
                    id+=1
                } else if (schudele.wednesday[i].week.isEmpty)&&(schudele.wednesday[i].isEven)&&(week%2==0){
                    arrForConclusion.append(Array<task>())
                                   arrForConclusion[1].append(.init())

                    arrForConclusion[1][id]=schudele.wednesday[i]
                    id+=1
                }
                i+=1
            }
            
            i=0
            id=0

            while(i<schudele.friday.count-1){
                

                if(schudele.friday[i].week.contains(week)){
                    arrForConclusion.append(Array<task>())
                    arrForConclusion[2].append(.init())
                    arrForConclusion[2][id]=schudele.friday[i]
                    id+=1
                } else if(schudele.friday[i].week.isEmpty)&&(schudele.friday[i].isOdd)&&(week%2==1){
                    arrForConclusion.append(Array<task>())
                    arrForConclusion[2].append(.init())
                    arrForConclusion[2][id]=schudele.friday[i]
                    id+=1
                } else if (schudele.friday[i].week.isEmpty)&&(schudele.friday[i].isEven)&&(week%2==0){
                    arrForConclusion.append(Array<task>())
                    arrForConclusion[2].append(.init())
                    arrForConclusion[2][id]=schudele.friday[i]
                    id+=1
                }
                i+=1
            }
        case 4:
            var i=0
            var id=0
            while(i<schudele.wednesday.count-1){
                

                if(schudele.wednesday[i].week.contains(week)){
                    arrForConclusion.append(Array<task>())
                    arrForConclusion[0].append(.init())
                    arrForConclusion[0][id]=schudele.wednesday[i]
                    id+=1
                } else if(schudele.wednesday[i].week.isEmpty)&&(schudele.wednesday[i].isOdd)&&(week%2==1){
                    arrForConclusion.append(Array<task>())
                    arrForConclusion[0].append(.init())
                    arrForConclusion[0][id]=schudele.wednesday[i]
                    id+=1
                } else if (schudele.wednesday[i].week.isEmpty)&&(schudele.wednesday[i].isEven)&&(week%2==0){
                    arrForConclusion.append(Array<task>())
                    arrForConclusion[0].append(.init())
                    arrForConclusion[0][id]=schudele.wednesday[i]
                    id+=1
                }
                i+=1
            }
            
            i=0
            id=0

            while(i<schudele.friday.count-1){
                

                if(schudele.friday[i].week.contains(week)){
                    arrForConclusion.append(Array<task>())
                    arrForConclusion[1].append(.init())
                    arrForConclusion[1][id]=schudele.friday[i]
                    id+=1
                } else if(schudele.friday[i].week.isEmpty)&&(schudele.friday[i].isOdd)&&(week%2==1){
                    arrForConclusion.append(Array<task>())
                    arrForConclusion[1].append(.init())
                    arrForConclusion[1][id]=schudele.friday[i]
                    id+=1
                } else if (schudele.friday[i].week.isEmpty)&&(schudele.friday[i].isEven)&&(week%2==0){
                    arrForConclusion.append(Array<task>())
                    arrForConclusion[1].append(.init())
                    arrForConclusion[1][id]=schudele.friday[i]
                    id+=1
                }
                i+=1
            }
            
            i=0
            id=0

            while(i<schudele.saturday.count-1){
              

                if(schudele.saturday[i].week.contains(week)){
                    arrForConclusion.append(Array<task>())
                                  arrForConclusion[2].append(.init())
                    arrForConclusion[2][id]=schudele.saturday[i]
                    id+=1
                } else if(schudele.saturday[i].week.isEmpty)&&(schudele.saturday[i].isOdd)&&(week%2==1){
                    arrForConclusion.append(Array<task>())
                                  arrForConclusion[2].append(.init())
                    arrForConclusion[2][id]=schudele.saturday[i]
                    id+=1
                } else if (schudele.saturday[i].week.isEmpty)&&(schudele.saturday[i].isEven)&&(week%2==0){
                    arrForConclusion.append(Array<task>())
                                  arrForConclusion[2].append(.init())
                    arrForConclusion[2][id]=schudele.saturday[i]
                    id+=1
                }
                i+=1
            }
        case 5:
            var i=0
            var id=0
            while(i<schudele.friday.count-1){
                
                

                if(schudele.friday[i].week.contains(week)){
                    arrForConclusion.append(Array<task>())
                    arrForConclusion[0].append(.init())
                    arrForConclusion[0][id]=schudele.friday[i]
                    id+=1
                } else if(schudele.friday[i].week.isEmpty)&&(schudele.friday[i].isOdd)&&(week%2==1){
                    arrForConclusion.append(Array<task>())
                    arrForConclusion[0].append(.init())
                    arrForConclusion[0][id]=schudele.friday[i]
                    id+=1
                } else if (schudele.friday[i].week.isEmpty)&&(schudele.friday[i].isEven)&&(week%2==0){
                    arrForConclusion.append(Array<task>())
                    arrForConclusion[0].append(.init())
                    arrForConclusion[0][id]=schudele.friday[i]
                    id+=1
                }
                i+=1
            }
            
            i=0
            id=0

            while(i<schudele.saturday.count-1){
                

                if(schudele.saturday[i].week.contains(week)){
                    arrForConclusion.append(Array<task>())
                    arrForConclusion[1].append(.init())
                    arrForConclusion[1][id]=schudele.saturday[i]
                    id+=1
                } else if(schudele.saturday[i].week.isEmpty)&&(schudele.saturday[i].isOdd)&&(week%2==1){
                    arrForConclusion.append(Array<task>())
                    arrForConclusion[1].append(.init())
                    arrForConclusion[1][id]=schudele.saturday[i]
                    id+=1
                } else if (schudele.saturday[i].week.isEmpty)&&(schudele.saturday[i].isEven)&&(week%2==0){
                    arrForConclusion.append(Array<task>())
                    arrForConclusion[1].append(.init())
                    arrForConclusion[1][id]=schudele.saturday[i]
                    id+=1
                }
                i+=1
            }
        case 6:
            var i=0
            var id=0
            while(i<schudele.saturday.count-1){
                

                if(schudele.saturday[i].week.contains(week)){
                    arrForConclusion.append(Array<task>())
                    arrForConclusion[0].append(.init())
                    arrForConclusion[0][id]=schudele.saturday[i]
                    id+=1
                } else if(schudele.saturday[i].week.isEmpty)&&(schudele.saturday[i].isOdd)&&(week%2==1){
                    arrForConclusion.append(Array<task>())
                    arrForConclusion[0].append(.init())
                    arrForConclusion[0][id]=schudele.saturday[i]
                    id+=1
                } else if (schudele.saturday[i].week.isEmpty)&&(schudele.saturday[i].isEven)&&(week%2==0){
                    arrForConclusion.append(Array<task>())
                    arrForConclusion[0].append(.init())
                    arrForConclusion[0][id]=schudele.saturday[i]
                    id+=1
                }
                i+=1
            }
            i=0
            id=0
            while(i<schudele.monday.count-1){
                

                if(schudele.monday[i].week.contains(week)){
                    arrForConclusion.append(Array<task>())
                    arrForConclusion[1].append(.init())
                    arrForConclusion[1][id]=schudele.monday[i]
                    id+=1
                } else if(schudele.monday[i].week.isEmpty)&&(schudele.monday[i].isOdd)&&(week%2==1){
                    arrForConclusion.append(Array<task>())
                    arrForConclusion[1].append(.init())
                    arrForConclusion[1][id]=schudele.monday[i]
                    id+=1
                } else if (schudele.monday[i].week.isEmpty)&&(schudele.monday[i].isEven)&&(week%2==0){
                    arrForConclusion.append(Array<task>())
                    arrForConclusion[1].append(.init())
                    arrForConclusion[1][id]=schudele.monday[i]
                    id+=1
                }
                i+=1
            }
            
        default:
            return
        }
        print(arrForConclusion)
        iJil=1
        viewDidLoad()
    }
    
    override func viewDidLoad() {
        let group="ktso-01-19"
        parsingData.onCompletion = {scheduleForWeek in
            self.schedeleForConclusion(schudele:scheduleForWeek)
        }
        parsingData.broadcastData(group: group)
        super.viewDidLoad()
        tableView.register(UINib(nibName: String(describing: CustomCell.self), bundle: nil),forCellReuseIdentifier:String(describing: CustomCell.self))
        
        
    }
    
}
