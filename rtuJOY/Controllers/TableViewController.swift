//
//  TableViewController.swift
//  rtuJOY
//
//  Created by Максим Палёхин on 09.07.2020.
//  Copyright © 2020 Максим Палёхин. All rights reserved.
//

import UIKit

let week = 10
var group="ktso-01-19"

class TableViewController: UITableViewController {
    var parsingData = ParsingData()
    var arrForConclusion:Array<Array<task>> = []
    var cell = CustomCell()
    
    
    var arrForCell:Array<Array<Int>> = []
    override func viewDidLoad() {
        group=currentGroup
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
    
    override func viewWillAppear(_ animated: Bool) {
        viewDidLoad()
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
        cell.numberAudince?.text = arrForConclusion[indexPath.section][indexPath.row].numberAudince
        cell.nameTeacher?.text = arrForConclusion[indexPath.section][indexPath.row].nameTeacher
        return cell
        
    }
    
    
    
    func schedeleForConclusion(schudele:schedulePerWeek){
        arrForConclusion=quanity()
        var i=0
        var j = 0
        var k = 0
        while i<arrForConclusion.count {
            j = 0
            k = 0
            while j < schudele.day[today()+i].count{
                if schudele.day[today()+i][j].week.contains(week){
                    arrForConclusion[i].append(task())
                    arrForConclusion[i][k]=schudele.day[today()+i][j]
                    k+=1
                }
                j+=1
            }
            arrForConclusion[i].sort{$0.number < $1.number}
            i+=1
        }
        
    
        print(arrForConclusion)
        DispatchQueue.main.async(execute: {
            self.tableView.reloadData()
        })
        
    }
}

