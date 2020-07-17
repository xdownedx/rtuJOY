//
//  TableViewController.swift
//  rtuJOY
//
//  Created by Максим Палёхин on 09.07.2020.
//  Copyright © 2020 Максим Палёхин. All rights reserved.
//

import UIKit

let rows = [2,3,1]
class TableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: String(describing: CustomCell.self), bundle: nil),forCellReuseIdentifier:String(describing: CustomCell.self))
        let group="ktso-01-17"
        pars(group: group)
    }
    
    
    
    // Получим количество секций в таблице
    override func numberOfSections(in tableView: UITableView) -> Int {
        guard (weekday>1)&&(weekday<6) else{
            return 2}
        return 3
    }
    
    //получим количество ячеек в секции
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rows[section]
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
        
        cell.timeStart?.text = "9:00"
        cell.nameLesson?.text = "Физика"
        cell.timeEnd?.text = "10:30"
        cell.typeLesson?.text = "семинар"
        cell.numberAudince?.text = "ауд. А-12"
        cell.nameTeacher?.text = "Пыркин А.Ю."
        return cell
        
    }
}
